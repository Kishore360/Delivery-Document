select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.opened_on_key' ELSE 'SUCCESS' END as Message
 from ( SELECT * FROM #MDS_TABLE_SCHEMA.change_task_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_task TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(DATE_FORMAT(convert_tz(SRC.opened_at, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'')
 <> coalesce(TRGT.opened_on_key,'')
