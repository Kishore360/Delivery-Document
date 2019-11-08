SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.manager_c_key' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.incident_final s
  join whirlpool_mdwdb.f_incident TRGT 
  ON (s.sys_id =TRGT.row_id 
  AND s.sourceinstance= TRGT.source_id )
  JOIN whirlpool_mdwdb.d_internal_contact LKP 
  ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',s.u_manager),'UNSPECIFIED')= LKP.row_id 
 AND s.sourceinstance= LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN s.u_manager IS NULL THEN 0 else -1 end) <>
  (TRGT.manager_c_key)
  
  