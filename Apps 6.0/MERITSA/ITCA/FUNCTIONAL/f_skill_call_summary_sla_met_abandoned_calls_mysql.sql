
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.sla_met_abandoned_call' ELSE 'SUCCESS' END as Message
FROM meritsa_mdsdb.dsplit_final SRC 
LEFT JOIN meritsa_mdwdb.f_skill_call_summary TRGT 
	ON ( concat(row_date,'~',acd,'~',trim(split))  =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE SRC.slvlabns<> TRGT.sla_met_abandoned_call
