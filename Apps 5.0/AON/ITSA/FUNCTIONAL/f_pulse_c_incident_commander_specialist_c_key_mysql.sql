 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_pulse_c.incident_commander_specialist_c_key' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt 
 from aon_mdsdb.u_aon_pulse_final SRC
 LEFT JOIN aon_mdwdb.f_pulse_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_internal_contact LKP 
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_incident_commander_specialist),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_incident_commander_specialist IS NULL THEN 0 else -1 end) <> (TRGT.incident_commander_specialist_c_key))b;