
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.answer_sla_met_calls' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.dsplit_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.acceptable,'')<> COALESCE(TRGT.answer_sla_met_calls,'')
