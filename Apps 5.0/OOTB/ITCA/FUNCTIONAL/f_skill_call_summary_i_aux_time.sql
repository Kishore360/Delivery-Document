
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.i_aux_time' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.hsplit_final SRC 
LEFT JOIN mercuryins_mdwdb.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',starttime,'~',acd,'~',trim(split),'~~',cdchash) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.i_auxtime,'')<> COALESCE(TRGT.i_aux_time,'')
