SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_cost.project_cost_plan_key' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.ppa_wip_final SRC where cdctype <> 'D' ) SRC
left join #MDS_TABLE_SCHEMA.ppa_wip_values_final SRC2
on SRC.TRANSNO = SRC2.TRANSNO 
and SRC.sourceinstance = SRC2.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_investments_final SRC3
on SRC.INVESTMENT_ID = SRC3.ID 
and SRC.sourceinstance = SRC3.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_projects_final SRC4
on SRC3.ID = SRC4.PRID 
and SRC3.sourceinstance = SRC4.sourceinstance
left join #MDS_TABLE_SCHEMA.cmn_lookups_final SRC5
on UPPER(SRC.COST_TYPE) = UPPER(SRC5.LOOKUP_CODE) AND SRC.sourceinstance = SRC5.sourceinstance
left join #MDS_TABLE_SCHEMA.transclass_final SRC6
on UPPER(SRC.TRANSCLASS) = UPPER(SRC6.TRANSCLASS) AND SRC.sourceinstance = SRC6.sourceinstance
left join (
select A.OBJECT_ID,D.END_DATE as pln_end_date,A.sourceinstance,C.START_DATE as pln_start_date ,A.ID as pln_id,B.COST_TYPE_ID,CONCAT(COALESCE(A.ID,'UNSPECIFIED'),'~',COALESCE(B.ID,'UNSPECIFIED')) as row_id ,B.TRANSACTION_CLASS_ID
from #MDS_TABLE_SCHEMA.fin_plans_final A
inner join #MDS_TABLE_SCHEMA.fin_cost_plan_details_final B
on A.ID = B.PLAN_ID 
AND A.sourceinstance = B.sourceinstance
inner join  #MDS_TABLE_SCHEMA.biz_com_periods_final C -- for start date
on A.START_PERIOD_ID = C.ID 
and A.sourceinstance = C.sourceinstance
inner join #MDS_TABLE_SCHEMA.biz_com_periods_final D -- for end date
on A.END_PERIOD_ID = D.ID
and A.sourceinstance = D.sourceinstance 
where UPPER(A.PLAN_TYPE_CODE) = 'FORECAST' AND UPPER(A.OBJECT_CODE) = 'PROJECT' AND A.IS_PLAN_OF_RECORD = 1 AND A.cdctype <> 'D' AND B.cdctype <> 'D'
)T1 
on T1.OBJECT_ID = SRC.INVESTMENT_ID
and T1.COST_TYPE_ID = SRC5.ID
and T1.TRANSACTION_CLASS_ID = SRC6.ID
and T1.sourceinstance = SRC.sourceinstance
and SRC.TRANSDATE >=
T1.pln_start_date and SRC.TRANSDATE <= T1.pln_end_date
left join #DWH_TABLE_SCHEMA.d_project_cost_plan TRGT2
on TRGT2.row_id = T1.pln_id
and TRGT2.source_id = T1.sourceinstance
left join #DWH_TABLE_SCHEMA.f_project_cost TRGT
on TRGT.row_id = COALESCE(CONCAT('ACT~',COALESCE(SRC.TRANSNO,'UNSPECIFIED'),'~',COALESCE(SRC2.ID,'UNSPECIFIED'),'~',COALESCE(DATE_FORMAT(SRC.TRANSDATE,'%Y%m%d'),'UNSPECIFED')),'UNSPECIFIED')
and TRGT.source_id = SRC.sourceinstance
where UPPER(SRC2.CURRENCY_TYPE) = 'HOME' AND UPPER(SRC3.ODF_OBJECT_CODE)='PROJECT' AND SRC4.IS_TEMPLATE=0 AND SRC4.IS_PROGRAM=0
and COALESCE(TRGT2.row_key,0)
<> COALESCE(TRGT.project_cost_plan_key,0)


