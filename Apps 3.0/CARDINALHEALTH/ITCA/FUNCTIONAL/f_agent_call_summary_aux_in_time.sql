
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.aux_in_time' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.dagent_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.auxintime,'')<> COALESCE(TRGT.aux_in_time,'')
