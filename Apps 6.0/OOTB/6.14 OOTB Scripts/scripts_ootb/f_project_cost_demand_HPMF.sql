SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.changed_by' ELSE 'SUCCESS' END as Message
FROM (select *  from   #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final where cdctype<>'D')SRC
left join   #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final B
on SRC.PRJ_FINANCIAL_SUMMARY_ID=B.FINANCIAL_SUMMARY_ID
AND SRC.SOURCEINSTANCE=B.SOURCEINSTANCE
inner join (select * from   #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final where period_id<>-1)C
on B.FORECAST_ACTUAL_ID=C.FORECAST_ACTUAL_ID
AND C.SOURCEINSTANCE=B.SOURCEINSTANCE
left join   (select CONCAT(FORECAST_ACTUAL_ID,'~',LABOR_TYPE_CODE,'~',EXPENSE_TYPE_CODE) AS actual_row_id,FORECAST_ACTUAL_ID,LABOR_TYPE_CODE,
 EXPENSE_TYPE_CODE,SOURCEINSTANCE,count(1) as forecast_count
from #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_lines_final group by 1,2,3,4,5) D
on D.FORECAST_ACTUAL_ID=C.FORECAST_ACTUAL_ID
and D.SOURCEINSTANCE=SRC.SOURCEINSTANCE
left join(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC2
on SRC2.prop_project_id=SRC.PRJ_PROJECT_ID
and SRC2.sourceinstance=SRC.sourceinstance
left join (select * from    #DWH_TABLE_SCHEMA.f_project_cost)TRGT
on TRGT.row_id=concat(SRC.PRJ_PROJECT_ID,'~',SRC.PRJ_FINANCIAL_SUMMARY_ID,'~',COALESCE(C.FORECAST_ACTUAL_PERIOD_SUM_ID,'UNSPECIFIED'),
'~',COALESCE(D.actual_row_id,'UNSPECIFIED'))
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
left join #DWH_TABLE_SCHEMA.d_demand LKP
on LKP.row_id = SRC2.request_id 
and SRC.sourceinstance = LKP.source_id
WHERE COALESCE(LKP.row_key,case when SRC2.request_id is null then 0 else -1 end)<> COALESCE(TRGT.demand_key,0)


