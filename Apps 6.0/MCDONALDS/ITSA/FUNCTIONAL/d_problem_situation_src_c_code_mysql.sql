SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.subcategory_src_c_code' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_problem trgt
RIGHT JOIN mcd_mdsdb.problem_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_subcategory <> trgt.subcategory_src_c_code
;