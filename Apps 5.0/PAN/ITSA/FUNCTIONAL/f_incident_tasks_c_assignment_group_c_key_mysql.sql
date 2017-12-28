SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
pan_mdsdb.u_incident_tasks_final a
join pan_mdsdb.sys_user_final b
on b.sys_id=a.opened_by and a.sourceinstance=b.sourceinstance
left join pan_mdwdb.f_incident_tasks_c c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
left join pan_mdwdb.d_internal_organization d
on d.row_id=case when COALESCE(CONCAT('GROUP~',a.assignment_group),'UNSPECIFIED')='UNSPECIFIED' then 'UNSPECIFIED' else
 concat('GROUP~',a.assignment_group)end
and d.source_id=b.sourceinstance where d.row_key<>c.assignment_group_c_key;