
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_project.project_name' ELSE 'SUCCESS' END as Message FROM (
SELECT count(1) as CNT
FROM   terex_mdsdb.pv_projects_final SRC 
LEFT JOIN  terex_mdwdb.d_project TRGT ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(SRC.Title1,
                'UNSPECIFIED') <>TRGT.project_name
AND SRC.cdctype='X' ) temp; 
