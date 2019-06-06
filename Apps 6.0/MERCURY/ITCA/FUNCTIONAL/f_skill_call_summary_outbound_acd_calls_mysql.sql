
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.outbound_acd_calls' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.dsplit_final SRC 
LEFT JOIN mercuryins_mdwdb.f_skill_call_summary TRGT 
	ON ( concat(row_date,'~',acd,'~',trim(split))  =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.o_othercalls,'')<> COALESCE(TRGT.outbound_acd_calls,'')
