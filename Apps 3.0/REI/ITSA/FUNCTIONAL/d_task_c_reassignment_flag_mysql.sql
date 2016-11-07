SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.task_final a
JOIN rei_mdwdb.d_task_c b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id 
where  CASE WHEN a.reassignment_count>0 THEN 'Y' ELSE 'N' END <> b.reassignment_flag
)a;