SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.incident_engaged_by_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM discover_mdsdb.incident_final SRC 
LEFT JOIN discover_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN discover_mdwdb.d_internal_contact LKP ON (COALESCE(concat('INTERNAL_CONTACT~',SRC.u_engaged_by),'UNSPECIFIED') =LKP.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_engaged_by IS NULL THEN 0 ELSE -1 END)<>TRGT.incident_engaged_by_c_key
AND SRC.cdctype='X'
) temp; 