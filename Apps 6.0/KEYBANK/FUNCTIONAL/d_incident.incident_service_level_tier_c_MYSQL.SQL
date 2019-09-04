
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.incident_service_level_tier_c' ELSE 'SUCCESS' END as Message
FROM 
( Select Count(1) as CNT
FROM  keybank_mdsdb.incident_final SRC 
LEFT JOIN keybank_mdwdb.d_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN keybank_mdwdb.d_lov LKP ON CONCAT('SERVICE_LEVEL_TIER_C~INCIDENT','~',SRC.u_service_level_tier)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_service_level_tier iS NULL THEN 0 ELSE -1 END)<>TRGT.incident_service_level_tier_c_key
AND TRGT.soft_deleted_flag='N' ) temp;