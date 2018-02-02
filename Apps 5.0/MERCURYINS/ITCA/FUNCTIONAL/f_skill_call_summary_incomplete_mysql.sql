
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.incomplete_flag' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.hsplit_final SRC 
LEFT JOIN mercuryins_mdwdb.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',starttime,'~',acd,'~',trim(split),'~~',cdchash) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE case when CONVERT(SRC.incomplete ,CHAR(20)) in ('y', 'Y', 'Yes', '1') THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.incomplete_flag,'') 
