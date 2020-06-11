SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.changed_by' ELSE 'SUCCESS' END as Message
FROM (select *  from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC
left join #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final B
on SRC.PRJ_FINANCIAL_SUMMARY_ID=B.FINANCIAL_SUMMARY_ID
AND SRC.SOURCEINSTANCE=B.SOURCEINSTANCE
inner join (select * from #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final where period_id<>-1)C
on B.FORECAST_ACTUAL_ID=C.FORECAST_ACTUAL_ID
AND C.SOURCEINSTANCE=B.SOURCEINSTANCE
left join (select CONCAT(FORECAST_ACTUAL_ID,'~',LABOR_TYPE_CODE,'~',EXPENSE_TYPE_CODE) AS actual_row_id,FORECAST_ACTUAL_ID,LABOR_TYPE_CODE,
 EXPENSE_TYPE_CODE,SOURCEINSTANCE,count(1) as forecast_count
from #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_lines_final group by 1,2,3,4,5) D
on D.FORECAST_ACTUAL_ID=C.FORECAST_ACTUAL_ID
and D.SOURCEINSTANCE=SRC.SOURCEINSTANCE
left join (select * from #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)E
on C.PERIOD_ID = E.FISCAL_PERIOD_ID 
left join (select * from  itpa_l_dev_mdwdb.f_project_cost)TRGT
on TRGT.row_id=concat(SRC.PRJ_PROJECT_ID,'~',SRC.PRJ_FINANCIAL_SUMMARY_ID,'~',COALESCE(C.FORECAST_ACTUAL_PERIOD_SUM_ID,'UNSPECIFIED'),
'~',COALESCE(D.actual_row_id,'UNSPECIFIED'))
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
WHERE COALESCE(CASE WHEN D.expense_type_code='CAPITAL' and D.labor_type_code='LABOR' then C.ACTUAL_CAPEX_LABOR_BSE   
WHEN D.expense_type_code='CAPITAL' and D.labor_type_code='NON_LABOR' then C.ACTUAL_CAPEX_NONLABOR_BSE 
else 0 END,'')<>ROUND(COALESCE(TRGT.actual_capital_doc_cost,''),10)
