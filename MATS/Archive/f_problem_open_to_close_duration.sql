

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.problem_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_problem TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
WHERE CONVERT( TIMESTAMPDIFF(second, opened_at, closed_at) using utf8)<> CONVERT( COALESCE(TRGT.open_to_close_duration,'') using utf8)
