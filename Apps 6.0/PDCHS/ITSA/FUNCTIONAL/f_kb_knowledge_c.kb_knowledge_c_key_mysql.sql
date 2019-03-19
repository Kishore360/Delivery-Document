SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_kb_knowledge_c.kb_knowledge_c_key' ELSE 'SUCCESS' END as Message 
FROM(select count(1) as CNT from 
(select sys_id,sourceinstance from pdchs_mdsdb.kb_knowledge_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.f_kb_knowledge_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
left join pdchs_mdwdb.d_kb_knowledge_c lkp on src.sys_id=lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_key, case when src.sys_id is null then 0 else -1 end) <> trgt.kb_knowledge_c_key)temp;