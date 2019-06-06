select case when count(1) then 'FAILURE' else 'SUCCESS' end as RESULT,
case when count(1) then 'Data Mismatch' else 'SUCCESS' end as Message
from gilead_mdsdb.task_final a
left join gilead_mdwdb.d_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join gilead_mdsdb.incident_final inc
on a.sys_id=inc.sys_id and a.sourceinstance=inc.sourceinstance
left join gilead_mdsdb.sc_task_final sc_task
on a.sys_id=sc_task.sys_id and a.sourceinstance=sc_task.sourceinstance
where  CASE WHEN a.sys_class_name ='incident' THEN CONVERT_TZ(inc.resolved_at,'GMT','America/New_York') 
WHEN a.sys_class_name ='sc_task' THEN CONVERT_TZ(sc_task.closed_at,'GMT','America/New_York') 
ELSE CONVERT_TZ(a.closed_at,'GMT','America/New_York') END<>b.last_resolved_on_c
and b.soft_deleted_flag='N';