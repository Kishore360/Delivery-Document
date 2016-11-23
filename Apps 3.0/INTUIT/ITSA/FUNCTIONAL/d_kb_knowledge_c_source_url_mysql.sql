SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
where 
CONCAT('<a href=\"','https://intuit.service-now.com/nav_to.do?uri=','kb_knowledge.do?sys_id=',src.sys_id,'\" target=\"_blank\">',src.number,'</a>') <> source_url
) temp