

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM mercury_mdsdb.sys_user_grmember_final SRC 
 LEFT JOIN mercury_mdwdb.f_assigned_to_group_member_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN mercury_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',SRC.group )= LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.group IS NULL THEN 0 else -1 end)<>
 (TRGT.assignment_group_key)
