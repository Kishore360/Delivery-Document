SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.u_third_contributing_flag_c' ELSE 'SUCCESS' END as Message 
FROM marriott_mdsdb.problem_final  SRC 
JOIN marriott_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  
WHERE SRC.u_third_contributing <> (TRGT.u_third_contributing_flag_c) 
