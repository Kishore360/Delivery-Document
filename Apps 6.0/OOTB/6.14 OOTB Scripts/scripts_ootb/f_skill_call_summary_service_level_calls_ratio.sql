SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.service_level_calls_ratio' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.hsplit_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',starttime,'~',acd,'~',trim(split),'~~',cdchash) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(TRGT.service_level_calls_ratio,'') is null