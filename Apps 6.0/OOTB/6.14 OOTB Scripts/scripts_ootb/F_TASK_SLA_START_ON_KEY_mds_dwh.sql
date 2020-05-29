SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_sla.start_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.task_sla_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_task_sla TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.start_time,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'') <> COALESCE(TRGT.start_on_key,'')
