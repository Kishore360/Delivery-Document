  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM pandg_mdsdb.change_request_final SRC
LEFT JOIN pandg_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',upper(u_pg_ci_approval_group))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN pandg_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_ci_approval_group IS NULL THEN 0 else -1 end)<> (TRGT.approval_group_c_key);
 
  