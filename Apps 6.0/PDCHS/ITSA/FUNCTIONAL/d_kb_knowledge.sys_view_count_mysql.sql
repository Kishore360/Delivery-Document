SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for kb_knowledge.published' ELSE 'SUCCESS' END as Message 
FROM pdchs_mdsdb.kb_knowledge_final as src
JOIN  pdchs_mdwdb.d_kb_knowledge_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id where 
src.sys_view_count<>trgt.sys_view_count_c and src.CDCTYPE<>'D'
;