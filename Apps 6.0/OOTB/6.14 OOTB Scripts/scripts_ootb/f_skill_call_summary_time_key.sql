
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.time_key' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_skill_call_summary TRGT 
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_time LKP 
	ON ( unspecified' = LKP.row_id
	AND TRGT.source_id =LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN unspecified' IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.time_key,'')
