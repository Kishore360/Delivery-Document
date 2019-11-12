SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_incident.downgrade_authorized_person_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from wpl_mdsdb.incident_final  SRC 
JOIN wpl_mdwdb.f_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
LEFT JOIN wpl_mdwdb.d_internal_contact LKP ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_downgrade_authorized_person),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_downgrade_authorized_person IS NULL THEN 0 else -1 end)<> (TRGT.downgrade_authorized_person_c_key) 
and SRC.cdctype='X')ma
