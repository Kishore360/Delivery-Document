SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.Parent_Age_At_Task_Open' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join #DWH_TABLE_SCHEMA.f_change_task TRGT 
on (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
JOIN #DWH_TABLE_SCHEMA.d_change_task d ON d.row_key = TRGT.change_task_key and d.source_id = TRGT.source_id
JOIN #DWH_TABLE_SCHEMA.d_change_request par ON par.row_key = TRGT.change_request_key
where TRGT.Parent_Age_At_Task_Open  <> (CASE WHEN d.opened_on > par.opened_on THEN 
TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),
CONVERT_TZ(d.opened_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'))
else 0 END) and ( TRGT.Parent_Age_At_Task_Open IS NULL OR TRGT.Parent_Age_At_Task_Open 
<> CASE WHEN d.opened_on > par.opened_on THEN 
TIMESTAMPDIFF(SECOND, CONVERT_TZ(par.opened_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),
CONVERT_TZ(d.opened_on,'<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>')) else 0 END);	
