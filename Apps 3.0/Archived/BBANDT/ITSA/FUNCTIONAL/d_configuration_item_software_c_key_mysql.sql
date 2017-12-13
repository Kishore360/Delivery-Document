SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_c_key' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.cmdb_ci_final SRC 
LEFT JOIN bbandt_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id= TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
 LEFT JOIN bbandt_mdwdb.d_software_c LKP 
 ON (SRC.sys_id =LKP.row_id AND SRC.sourceinstance= LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.software_c_key);
 
 