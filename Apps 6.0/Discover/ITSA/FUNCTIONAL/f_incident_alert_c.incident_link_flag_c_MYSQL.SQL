SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_incident_alert_c.description_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM discover_mdsdb.incident_alert_final SRC 
JOIN discover_mdwdb.f_incident_alert_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id 
WHERE 
CASE WHEN SRC.source_incident IS NOT NULL THEN 'Y' ELSE 'N' END <> TRGT.incident_link_flag_c
AND SRC.cdctype='X'
) temp;


