
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN  'MDS to DWH data validation failed for d_incident.created_on' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM nypres_mdsdb.incident_final SRC 
JOIN nypres_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
Where coalesce(convert_tz(SRC.sys_created_on,'GMT','America/New_York'),convert_tz(SRC.opened_at,'GMT','America/New_York'))<>TRGT.created_on
) temp;


