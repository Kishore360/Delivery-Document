SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final b
left join intuit_mdsdb.sys_audit_final a
on  b.sys_id =a.documentkey
left  JOIN  (select ROW_ID , source_id, time_to_assign_change_task,created_on
from intuit_mdwdb.d_change_task_c) c
on  b.sys_id = c.ROW_ID and b.sourceinstance=c.source_id
where  (tablename='change_task'and fieldname='assigned_to' and a.oldvalue is null) 
and c.time_to_assign_change_task <> coalesce(convert_tz(a.sys_created_on,'GMT','America/Los_Angeles'),c.created_on)
) temp