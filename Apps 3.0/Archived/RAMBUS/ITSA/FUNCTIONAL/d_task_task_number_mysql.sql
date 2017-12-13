SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

rambus_mdsdb.task_final a
join rambus_mdwdb.d_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.task_number<> a.number;


