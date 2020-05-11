
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_project.planned_end_on' ELSE 'SUCCESS' END as Message FROM (
SELECT  count(1) as CNT
FROM   terex_mdsdb.pv_projects_final SRC 
LEFT JOIN terex_mdwdb.d_project TRGT ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  CONVERT_TZ (SRC.Original_Due_Date,
                'UTC',
                'America/New_York') <>TRGT.planned_end_on
AND SRC.cdctype='X' ) temp; 