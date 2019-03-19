SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.sc_task_final a
join cardinalhealth_mdwdb.d_request_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdsdb.u_module_final c
on c.sys_id=a.u_module and a.sourceinstance=c.sourceinstance
where b.module_c<>c.u_module_name)temp;