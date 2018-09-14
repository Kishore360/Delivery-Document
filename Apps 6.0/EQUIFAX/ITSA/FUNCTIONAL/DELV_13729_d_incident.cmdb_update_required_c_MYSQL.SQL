SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.cmdb_update_required_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.incident_final SRC 
LEFT JOIN equifax_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE case when SRC.u_cmdb_update_required=1 then 'Y' else 'N' end <>TRGT.cmdb_update_required_c
) temp;



