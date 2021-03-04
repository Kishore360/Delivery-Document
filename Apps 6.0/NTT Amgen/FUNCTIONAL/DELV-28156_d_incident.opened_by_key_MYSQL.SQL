SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DWD Data Validation Failed for d_incident.opened_by_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM ntt_amgen_mdsdb.incident_final SRC 
LEFT JOIN ntt_amgen_mdwdb.d_incident TRGT ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN ntt_amgen_mdwdb.d_internal_contact LKP ON CONCAT('INTERNAL_CONTACT~',SRC.caller_id)=LKP.row_id 
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.caller_id IS NULL THEN 0 ELSE -1 END)<>TRGT.opened_by_key
AND SRC.cdctype='X'
) temp;




 
