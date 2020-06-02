
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.day_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.dagent_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.row_date / starttime_utc,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.row_date / starttime_utc IS NULL THEN 0 else '-1' end)  <> COALESCE(TRGT.day_key,'') 
