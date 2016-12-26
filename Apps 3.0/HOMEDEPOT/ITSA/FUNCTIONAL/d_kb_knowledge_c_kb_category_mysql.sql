
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM homedepot_mdsdb.kb_knowledge_final src
 join homedepot_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
 join homedepot_mdsdb.kb_category_final lkp
 ON lkp.sys_id=src.kb_category and src.sourceinstance=lkp.sourceinstance
where 
lkp.label <> tgt.kb_category
) temp



