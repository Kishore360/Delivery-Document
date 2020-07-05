SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.accepted_by_key' ELSE 'SUCCESS' END as Message
 FROM truist_mdsdb.cmdb_ci_server_final SRC 
 LEFT JOIN truist_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN truist_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC.u_accepted_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE LKP.dw_updated_on<TRGT.dw_updated_on and  COALESCE(LKP.row_key,CASE WHEN SRC.u_accepted_by IS NULL THEN 0 else -1 end)<> (TRGT.accepted_by_key)