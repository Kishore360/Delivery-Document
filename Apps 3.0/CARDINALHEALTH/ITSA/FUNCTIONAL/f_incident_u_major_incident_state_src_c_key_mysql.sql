 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.incident_final SRC 
  JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON COALESCE(CONCAT('U_MAJOR_INCIDENT_STATE~INCIDENT','~','~','~',UPPER(SRC.u_major_incident_state)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_major_incident_state IS NULL THEN 0 else -1 end)<> (TRGT.u_major_incident_state_src_c_key)