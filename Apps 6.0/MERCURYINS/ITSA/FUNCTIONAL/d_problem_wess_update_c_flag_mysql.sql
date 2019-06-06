SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.wess_update_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.problem_final  SRC 
JOIN mercury_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.u_wess_update = 1 then 'Y' else 'N' END) <> (TRGT.wess_update_c_flag) 
