SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.u_troubleshoot_next_steps_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.incident_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE substring(COALESCE(SRC.u_troubleshoot_next_steps,'UNSPECIFIED'),1,255)<>TRGT.u_troubleshoot_next_steps_c
AND SRC.cdctype='X' ) temp; 
