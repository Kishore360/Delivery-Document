SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.first_pass_reason_c_key' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjx_mdsdb.incident_final src
JOIN tjx_mdwdb.d_incident trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
JOIN tjx_mdwdb.d_lov LKP ON (COALESCE(CONCAT('FIRST_PASS_REASON_CODE','~','INCIDENT','~','~','~',UPPER(src.u_first_pass_reason_code)),'UNSPECIFIED')=LKP.row_id AND src.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN src.u_first_pass_reason_code IS NULL THEN 0 ELSE -1 END)<>(trgt.first_pass_reason_c_key)
)temp;

