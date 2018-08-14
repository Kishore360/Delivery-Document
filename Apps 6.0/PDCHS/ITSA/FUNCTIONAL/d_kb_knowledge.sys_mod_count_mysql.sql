SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for kb_knowledge.sys_mod_count' ELSE 'SUCCESS' END as Message 
FROM pdchs_mdsdb.kb_knowledge_final  src
JOIN  pdchs_mdwdb.d_kb_knowledge_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id where 
src.sys_mod_count<>trgt.sys_mod_count_c
;