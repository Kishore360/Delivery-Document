
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.inbound_acd_calls' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.dagent_final SRC 
LEFT JOIN mercury_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE (acdcalls + da_acdcalls - o_acdcalls )<> TRGT.inbound_acd_calls
