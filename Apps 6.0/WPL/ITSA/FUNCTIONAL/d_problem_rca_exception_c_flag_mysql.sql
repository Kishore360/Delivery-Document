SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.rca_exception_c_flag' ELSE 'SUCCESS' END as Message 
FROM wpl_mdwdb.d_problem trgt
RIGHT JOIN wpl_mdsdb.problem_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.u_rca_exception = 1 THEN 'Y' ELSE 'N' END <>trgt.rca_exception_c_flag
and src.cdctype='X'
;
