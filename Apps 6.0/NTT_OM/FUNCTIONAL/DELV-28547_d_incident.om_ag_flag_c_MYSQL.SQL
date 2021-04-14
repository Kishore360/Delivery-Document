SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.om_ag_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM ntt_om_mdsdb.incident_final SRC 
LEFT JOIN ntt_om_mdsdb.sys_user_group_final SRC1 ON SRC.assignment_group=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN ntt_om_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN SRC1.name IN ('OM-US-Service Desk','OM-GP-Service Desk') THEN 'Y' ELSE 'N' END <>TRGT.om_ag_flag_c
AND SRC.cdctype='X'
) temp;

 