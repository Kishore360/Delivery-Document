

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM mercury_mdsdb.problem_final SRC 
 LEFT JOIN mercury_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )  
 LEFT JOIN mercury_mdwdb.d_configuration_item LKP 
 ON ( SRC.u_ci_name= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )and LKP.soft_deleted_flag='N' and LKP.current_flag='Y'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_ci_name IS NULL THEN 0 else -1 end)<> (TRGT.cmdb_ci_c_key)
and  SRC.CDCTYPE= 'X'