
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux.day_id' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.f_agent_call_summary_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary_aux TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CASE WHEN starttime_utc is null, extract date  in the format yyyymmdd from row_date
else extract date  in the format yyyymmdd from timezone converted starttime_utc END ,'')<> COALESCE(TRGT.day_id ,'')
