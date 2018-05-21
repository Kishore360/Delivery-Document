SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.category_c_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_problem trgt
RIGHT JOIN  (select * from mcdonalds_mdsdb.problem_final where cdctype<>'D') src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_kb_knowledge_base_c lkp
ON COALESCE(u_category,'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (src.cdctime<=f1.lastupdated) and COALESCE(lkp.row_key,CASE WHEN src.u_category IS NULL THEN 0 else -1 end)<> trgt.category_c_key
;
