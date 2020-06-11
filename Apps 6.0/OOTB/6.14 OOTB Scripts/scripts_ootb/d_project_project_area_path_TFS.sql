SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.project_area_path' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.dimteamproject_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_project TRGT 
	ON (SRC.projectnodesk =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id)
WHERE TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
COALESCE(SRC.projectpath,'')<> COALESCE(TRGT.project_area_path,'');