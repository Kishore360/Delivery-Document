SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.sc_task_final a
join cardinalhealth_mdwdb.d_request_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdsdb.u_complexity_final c
on a.u_complexity=c.sys_id and a.sourceinstance=c.sourceinstance
where b.complexity_c<>c.u_value;