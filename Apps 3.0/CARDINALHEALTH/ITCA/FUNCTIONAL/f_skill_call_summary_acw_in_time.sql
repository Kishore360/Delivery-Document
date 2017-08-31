
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.acw_in_time' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.dsplit_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.acwintime,'')<> COALESCE(TRGT.acw_in_time,'')
