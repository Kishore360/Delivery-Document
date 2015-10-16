SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_organization lkp
on lkp.row_id = COALESCE(CONCAT('GROUP~',s.assignment_group),'UNSPECIFIED') AND lkp.source_id=s.sourceinstance
WHERE lkp.row_key <> t.assignment_group_key) temp