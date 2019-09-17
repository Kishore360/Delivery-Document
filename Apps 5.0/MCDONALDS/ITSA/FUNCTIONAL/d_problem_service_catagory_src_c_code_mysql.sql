SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.service_catagory_src_c_code' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_problem trgt
RIGHT JOIN mcdonalds_mdsdb.problem_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_service_catagory <> trgt.service_catagory_src_c_code;