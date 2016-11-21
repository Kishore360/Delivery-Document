SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
nbcu_mdsdb.incident_final a
join nbcu_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join nbcu_mdwdb.d_task c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where coalesce(c.row_key, case when a.sys_id is null then 0 else -1 end)<> b.parent_task_c_key;
