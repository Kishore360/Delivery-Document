
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.incomplete_flag' ELSE 'SUCCESS' END as Message
FROM meritsa_mdsdb.dagent_final SRC 
LEFT JOIN meritsa_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE case when CONVERT(SRC.incomplete ,CHAR(20)) in ('y', 'Y', 'Yes', '1') THEN 'Y' ELSE 'N' END <>TRGT.incomplete_flag
