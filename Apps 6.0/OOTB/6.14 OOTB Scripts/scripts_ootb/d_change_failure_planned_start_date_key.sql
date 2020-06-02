SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_start_on_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and soft_deleted_flag='N')TRGT
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
where COALESCE(LKP.row_key,CASE WHEN SRC.start_date IS NULL THEN '' else '' end)<>TRGT.planned_start_date_key;