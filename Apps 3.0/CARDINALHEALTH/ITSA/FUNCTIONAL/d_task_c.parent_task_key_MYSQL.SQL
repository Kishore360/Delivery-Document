
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from(
select count(1) as cnt from cardinalhealth_mdsdb.task_final a
join cardinalhealth_mdwdb.d_task_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_task_c c
on  COALESCE(a.parent,'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key,case when a.parent is null then 0 else -1 end ) <> b.parent_task_key 
and b.soft_deleted_flag<>'Y')ma;




