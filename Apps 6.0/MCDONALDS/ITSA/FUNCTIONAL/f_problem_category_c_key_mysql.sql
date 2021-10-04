SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.category_c_key' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_problem trgt
RIGHT JOIN mcd_mdsdb.problem_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_kb_knowledge_base_c lkp
ON COALESCE(u_category,'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_category IS NULL THEN 0 else -1 end)<> trgt.category_c_key
;
