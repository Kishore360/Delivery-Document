
SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.new_call_final a
join cardinalhealth_mdwdb.f_call b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_task_c c
on  COALESCE(a.transferred_to,'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key,case when a.transferred_to is null then 0 else -1 end ) <> b.task_c_key;


