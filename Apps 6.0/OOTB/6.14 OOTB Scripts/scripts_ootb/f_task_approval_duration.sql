SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.approval_duration' ELSE 'SUCCESS' END as Message

 from  ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') SRC 
JOIN #DWH_TABLE_SCHEMA.f_task TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_task d 
 ON (d.row_id=SRC.sys_id 
 AND d.source_id=SRC.sourceinstance)
WHERE case when coalesce(convert_tz(d.approved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),'') > coalesce(convert_tz(d.opened_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),'')  
then TIMESTAMPDIFF(SECOND,convert_tz(d.opened_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(d.approved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')) else 0 end 
 <> COALESCE(TRGT.approval_duration ,'')
 
 