SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.support_group_c_key' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.incident_final s
  JOIN whirlpool_mdsdb.cmdb_ci_final cmdb_ci 
 ON s.cmdb_ci = cmdb_ci.sys_id 
  join whirlpool_mdwdb.f_incident TRGT 
  ON (s.sys_id =TRGT.row_id 
  AND s.sourceinstance= TRGT.source_id )
  JOIN whirlpool_mdwdb.d_internal_organization LKP 
  ON (COALESCE(CONCAT('GROUP~',cmdb_ci.support_group),'UNSPECIFIED')= LKP.row_id 
 AND s.sourceinstance= LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN cmdb_ci.support_group IS NULL THEN 0 else -1 end) <>
  (TRGT.support_group_c_key) and s.cdctype='X'
  
  
  