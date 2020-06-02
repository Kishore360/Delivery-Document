SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.created_on' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.f_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
WHERE coalesce(substr(CONVERT_TZ(SRC.create_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),1,19),'')<> COALESCE(TRGT.created_on,'')
