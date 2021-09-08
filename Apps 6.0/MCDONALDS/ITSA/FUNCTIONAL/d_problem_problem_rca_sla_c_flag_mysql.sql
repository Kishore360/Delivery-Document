SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.problem_rca_sla_c_flag' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_problem trgt
RIGHT JOIN mcd_mdsdb.problem_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.u_problem_rca_sla = 1 THEN 'Y' ELSE 'N' END <>problem_rca_sla_c_flag
;