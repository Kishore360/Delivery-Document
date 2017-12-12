SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.project_manager_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_project_final SRC 
 LEFT JOIN #MDS_TABLE_SCHEMA.fx_currency_instance_final FI
 ON (FI.id=SRC.sys_id and FI.field='work_cost') 
  LEFT JOIN #MDS_TABLE_SCHEMA.fm_expense_line_final FEI 
 ON (FEI.task=SRC.sys_id ) 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',project_manager) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.project_manager IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_manager_key ,'')
