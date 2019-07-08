
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.acd_key' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.dagent_final SRC 
LEFT JOIN mercury_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN mercury_mdwdb.d_acd LKP 
	ON (SRC.acd = LKP.row_id
	AND SRC.sourceinstance = LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.acd IS NULL THEN 0 else '-1' end)<>TRGT.acd_key
