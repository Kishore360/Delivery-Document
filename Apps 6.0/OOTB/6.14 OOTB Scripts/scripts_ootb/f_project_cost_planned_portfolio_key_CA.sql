SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_cost.portfolio_key' ELSE 'SUCCESS' END as Message
 FROM (select * from  #MDS_TABLE_SCHEMA.fin_plans_final  SRC where cdctype <> 'D' ) SRC
left join  #MDS_TABLE_SCHEMA.fin_cost_plan_details_final SRC2
on SRC.ID = SRC2.PLAN_ID 
and SRC.sourceinstance = SRC2.sourceinstance
inner join  #MDS_TABLE_SCHEMA.odf_ssl_cst_dtl_cost_final SRC3
on SRC3.PRJ_OBJECT_ID = SRC2.ID 
and SRC3.sourceinstance = SRC2.sourceinstance
left join  #MDS_TABLE_SCHEMA.inv_investments_final SRC4
on SRC4.ID = SRC.OBJECT_ID
and SRC4.sourceinstance = SRC.sourceinstance
left join  #MDS_TABLE_SCHEMA.inv_projects_final SRC5 
on SRC5.PRID = SRC4.ID
and SRC5.sourceinstance = SRC4.sourceinstance
left join  #DWH_TABLE_SCHEMA.f_project_cost TRGT
on COALESCE(CONCAT('PLAN~',SRC.ID,'~',COALESCE(SRC2.ID,'UNSPECIFIED'),'~',COALESCE(DATE_FORMAT(SRC3.START_DATE,'%Y%m%d'),'UNSPECIFIED')),'UNSPECIFIED')
= TRGT.row_id
and SRC.sourceinstance = TRGT.source_id
left join (select X.INVESTMENT_ID,X.sourceinstance,count(1),X.PORTFOLIO_ID
from  #MDS_TABLE_SCHEMA.pfm_investments_final X
group by 1,2) T1
on T1.INVESTMENT_ID = SRC4.ID
and T1.sourceinstance = SRC.sourceinstance
left join (select Y.INVESTMENT_ID,Y.sourceinstance,Y.PORTFOLIO_ID,min(Y.ID) as port_id
from  #MDS_TABLE_SCHEMA.pfm_investments_final Y
where UPPER(Y.ODF_OBJECT_CODE) = 'PROJECT' and Y.cdctype <> 'D'
group by 1,2) T2
on T1.INVESTMENT_ID = T2.INVESTMENT_ID
and T1.sourceinstance = T2.sourceinstance
left join  #DWH_TABLE_SCHEMA.d_portfolio TRGT2
on TRGT2.row_id = T2.PORTFOLIO_ID
AND TRGT2.source_id = T2.sourceinstance
where UPPER(SRC.PLAN_TYPE_CODE)='FORECAST' AND UPPER(SRC.OBJECT_CODE) = 'PROJECT' AND UPPER(SRC4.ODF_OBJECT_CODE)='PROJECT' AND SRC5.IS_PROGRAM=0 AND SRC5.IS_TEMPLATE=0	
and COALESCE(TRGT2.row_key,'0')
<> COALESCE(TRGT.portfolio_key,'0');