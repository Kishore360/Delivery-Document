
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.time_key' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.dagent_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN mercuryins_mdwdb.d_calendar_time LKP 
on (LKP.row_id  = lpad(starttime, 4, '0')  and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.starttime IS NULL THEN 0 else '' end) <> TRGT.time_key
