
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_src_url' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.pm_project_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( concat('#PART1',SRC.sys_id,'#PART2') ,'')<> COALESCE(TRGT.project_src_url ,'')
 