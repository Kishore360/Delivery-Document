SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.day_key' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.dagent_final SRC
LEFT JOIN mercury_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN mercury_mdwdb.d_calendar_date LKP 
	ON LKP.row_id = date_format(SRC.row_date,'%Y%m%d')
WHERE COALESCE(LKP.row_key,case when SRC.row_date is null then 0 else -1 end)  <> TRGT.day_key