SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.assignment_group_type_key' ELSE 'SUCCESS' END as Message
  FROM wpl_mdsdb.incident_final s
  join wpl_mdsdb.sys_user_group_final sug
 on s.assignment_group=sug.sys_id
 join wpl_mdsdb.sys_user_group_type_final sug_type
 on sug.type=sug_type.sys_id
  join wpl_mdwdb.f_incident TRGT 
  ON (s.sys_id =TRGT.row_id 
  AND s.sourceinstance= TRGT.source_id )
  JOIN wpl_mdwdb.d_lov LKP 
  ON ( COALESCE(CONCAT('ASSIGNMENT_GROUP_TYPE~',sug_type.sys_id),'UNSPECIFIED')= LKP.row_id 
 AND s.sourceinstance= LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN sug_type.sys_id IS NULL THEN 0 else -1 end)<>
  (TRGT.assignment_group_type_c_key) and s.cdctype='X'
  
  
  