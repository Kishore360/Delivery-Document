			
							SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

nbcu_mdsdb.task_final a
join nbcu_mdsdb.incident_final c on a.sys_id=c.sys_id and a.sourceinstance=c.sourceinstance
join nbcu_mdwdb.d_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where last_resolved_on_c<>CONVERT_TZ(coalesce(c.resolved_at,c.closed_at),'GMT','America/New_York')
 or case when c.reopen_count>0 then 'Y' else 'N' end <>reopened_c_flag
 or b.task_update_count_c <> a.sys_mod_count