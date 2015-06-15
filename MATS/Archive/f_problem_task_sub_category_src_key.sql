

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.sub_category_src_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.problem_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONVERT(concat('SUBCATEGORY','~','','~','~','~',upper(null)) using utf8)= convert(LKP.src_rowid using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN null IS NULL THEN 0 else '-1' end)<> COALESCE(CONVERT(TRGT.sub_category_src_key using utf8),'')
