SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_problem.service_catagory_src_c_code' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from 
mcd_mdsdb.problem_final src
left join mcd_mdwdb.d_problem trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_service_catagory <> trgt.service_catagory_src_c_code and src.CDCTYPE='X')ma;