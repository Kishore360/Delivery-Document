
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.i_acw_time' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.dagent_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.i_acwtime,'')<> COALESCE(TRGT.i_acw_time,'')
