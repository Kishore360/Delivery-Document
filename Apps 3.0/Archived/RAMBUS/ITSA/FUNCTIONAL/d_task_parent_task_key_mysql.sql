SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
rambus_mdsdb.task_final a
join rambus_mdwdb.d_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join rambus_mdwdb.d_task c
on a.parent=c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key, case when a.parent is null then 0 else -1 end) <> b.parent_task_key;




