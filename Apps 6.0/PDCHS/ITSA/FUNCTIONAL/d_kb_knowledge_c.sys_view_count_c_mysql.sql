SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_kb_knowledge_c.sys_view_count_c' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,sys_view_count from pdchs_mdsdb.kb_knowledge_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_kb_knowledge_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where src.sys_view_count <> trgt.sys_view_count_c ) temp;