SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem.project_cost_center_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from truist_mdsdb.cmdb_ci_server_final SRC 
 LEFT JOIN truist_mdwdb.d_server_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN truist_mdwdb.d_cost_center LKP 
 ON ( SRC.u_project_cost_center= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_project_cost_center IS NULL THEN 0 else -1 end)<>TRGT.project_cost_center_key
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma
