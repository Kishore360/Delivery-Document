SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.u_customer_experience_comments_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.incident_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  COALESCE(SRC.u_customer_experience_comments,'UNSPECIFIED') <> TRGT.u_customer_experience_comments_c
AND SRC.cdctype='X' ) temp; 