
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DWD Data Validation Failed for d_incident.resolved_by_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM ntt_amgen_mdsdb.incident_final SRC 
LEFT JOIN ntt_amgen_mdwdb.d_incident TRGT ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN ntt_amgen_mdwdb.d_internal_contact LKP 
ON case when SRC.resolved_by is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~', SRC.resolved_by) END =LKP.row_id 
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.resolved_by IS NULL THEN 0 ELSE -1 END)<>TRGT.resolved_by_key
AND SRC.state='7'
AND SRC.cdctype='X'
) temp;
