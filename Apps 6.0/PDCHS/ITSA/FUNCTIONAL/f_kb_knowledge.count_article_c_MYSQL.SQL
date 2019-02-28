select  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for f_kb_knowledge.count_article_c' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt from pdchs_mdwdb.f_kb_knowledge_c TRGT
 right join (select ta.sys_id,ta.sourceinstance,count(u.article) as cnt from pdchs_mdsdb.kb_knowledge_final ta
join pdchs_mdsdb.kb_use_final u on ta.sys_id=u.article and ta.sourceinstance = u.sourceinstance 
group by 1)temp 
on TRGT.row_id=temp.sys_id and TRGT.source_id=temp.sourceinstance  
where TRGT.count_article_c<>temp.cnt
)temp1;

