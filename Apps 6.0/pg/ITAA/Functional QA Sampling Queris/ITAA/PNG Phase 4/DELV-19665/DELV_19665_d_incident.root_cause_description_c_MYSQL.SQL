SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.root_cause_description_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.incident_final SRC 
LEFT JOIN pgitsa_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.u_string_3,'UNSPECIFIED')<>TRGT.root_cause_description_c
AND SRC.cdctype='X'
) temp;




