
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.i_aux_time' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.hagent_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',starttime,'~',acd,'~',split,'~',trim(logid),'~',loc_id, '~~', cdchash) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.i_auxtime,'')<> COALESCE(TRGT.i_aux_time,'')
