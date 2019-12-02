SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.affected_services_c_key' ELSE 'SUCCESS' END as Message 
 FROM cox_mdsdb.problem_final  SRC JOIN cox_mdwdb.f_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN cox_mdwdb.d_affected_services_c LKP ON ( concat( '' ,upper( SRC.u_affected_service)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_affected_service IS NULL THEN 0 else -1 end)<> (TRGT.affected_services_c_key) 
