SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.impacted_location_c_key' ELSE 'SUCCESS' END as Message
  FROM wpl_mdsdb.incident_final s
  join wpl_mdwdb.f_incident TRGT 
  ON (s.sys_id =TRGT.row_id 
  AND s.sourceinstance= TRGT.source_id )
  JOIN wpl_mdwdb.d_location LKP 
  ON ( COALESCE(s.u_impacted_location,'UNSPECIFIED')= LKP.row_id 
 AND s.sourceinstance= LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN s.u_impacted_location IS NULL THEN 0 else -1 end) <>
  (TRGT.impacted_location_c_key) and s.cdctype='X'
  
  