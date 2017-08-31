
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.answer_service_level' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.dsplit_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.servicelevel,'')<> COALESCE(TRGT.answer_service_level,'')
