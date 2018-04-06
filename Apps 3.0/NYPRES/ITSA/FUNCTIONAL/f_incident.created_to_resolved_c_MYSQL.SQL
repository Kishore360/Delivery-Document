

SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN  'MDS to DWH data validation failed for f_incident.created_to_resolved_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM nypres_mdsdb.incident_final SRC 
JOIN nypres_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE TIMESTAMPDIFF(SECOND,coalesce(SRC.sys_created_on,SRC.opened_at),SRC.resolved_at)<>TRGT.created_to_resolved_c
) temp;


