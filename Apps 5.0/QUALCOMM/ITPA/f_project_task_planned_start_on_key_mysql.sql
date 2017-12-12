

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.planned_start_on_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_project_final SRC 
 LEFT JOIN #MDS_TABLE_SCHEMA.fx_currency_instance_final FI
 ON (FI.id=SRC.sys_id and FI.field='work_cost') 
 LEFT JOIN #MDS_TABLE_SCHEMA.fm_expense_line_final FEI 
 ON (FEI.task=SRC.sys_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.start_date IS NULL THEN 0 else '-1' end)  <> COALESCE(TRGT.planned_start_on_key,'') 
