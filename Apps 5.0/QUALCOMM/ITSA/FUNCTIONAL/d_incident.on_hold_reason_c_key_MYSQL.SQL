SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.on_hold_reason_c_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN qualcomm_mdwdb.d_lov LKP 
 ON COALESCE( CONCAT('HOLD_REASON~INCIDENT~~~',UPPER(SRC.hold_reason)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.hold_reason IS NULL THEN 0 else -1 end)<> (TRGT.on_hold_reason_c_key)
and SRC.CDCTYPE='X';

