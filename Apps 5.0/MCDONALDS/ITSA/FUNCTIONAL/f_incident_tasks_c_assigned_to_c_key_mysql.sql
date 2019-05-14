SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'SUCCESS' END as Message
from
mcdonalds_mdsdb.incident_task_final a
join mcdonalds_mdsdb.sys_user_final b
on b.sys_id=a.opened_by and a.sourceinstance=b.sourceinstance
join mcdonalds_mdwdb.f_incident_task_c c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
left join mcdonalds_mdwdb.d_internal_contact d
on COALESCE(CONCAT('INTERNAL_CONTACT~',a.assigned_to),'UNSPECIFIED') =d.row_id
and d.source_id=b.sourceinstance 
where COALESCE(d.row_key,CASE WHEN a.assigned_to IS NULL THEN 0 else -1 end)<>c.assigned_to_key;