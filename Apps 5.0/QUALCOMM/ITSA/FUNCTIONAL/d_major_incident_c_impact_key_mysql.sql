SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_major_incident_c.impact_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_major_incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN qualcomm_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('IMPACT','~','U_MAJOR_INCIDENT','~','~','~',UPPER(SRC.impact)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_key);