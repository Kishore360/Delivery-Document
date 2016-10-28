SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt

from pgi_mdsdb.problem_final a

left join pgi_mdwdb.d_problem b

on a.sys_id=b.row_id 

and a.sourceinstance=b.source_id

left join pgi_mdsdb.kb_knowledge_final c

on a.u_knowledge_article=c.sys_id and c.workflow_state='published'

where c.number <> b.knowledge_article_c) d