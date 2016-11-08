SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.change_task_final a
JOIN rei_mdwdb.f_change_task_c b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id 
join
rei_mdwdb.d_change_task_c c
on a.sys_id=c.row_id
where coalesce(c.row_key,case when a.sys_id is null then 0 else -1  end )<>b.change_task_key

)a;