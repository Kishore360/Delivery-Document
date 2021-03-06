
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.employee_key' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.dagent_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact LKP 
	ON ( COALESCE(CONCAT('INTERNAL_CONTACT~1~',trim(SRC.logid)),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN trim(SRC.logid) IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.employee_key ,'')
