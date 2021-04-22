SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_incident_alert_c.created_by' ELSE 'SUCCESS' END as Message 
FROM 
(SELECT Count(1) as CNT 
FROM discover_mdsdb.incident_alert_final  SRC 
JOIN discover_mdwdb.f_incident_alert_c TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE COALESCE(SRC.sys_created_by,'UNSPECIFIED')<> (TRGT.created_by) 
and SRC.cdctype ='X'
) temp;


