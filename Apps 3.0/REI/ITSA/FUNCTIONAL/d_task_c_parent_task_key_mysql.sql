SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.task_final a
JOIN rei_mdwdb.d_task_c b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id 
join  rei_mdwdb.d_task c
on a.u_top_level_parent=c.row_id and b.source_id=c.source_id
where  COALESCE(c.row_key,CASE WHEN a.u_top_level_parent is null then 0 else -1 END ) <> b.parent_task_key
)a;