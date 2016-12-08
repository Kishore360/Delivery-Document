SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  mercuryins_mdsdb.task_sla_final s
left  JOIN mercuryins_mdwdb.f_task_sla t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join mercuryins_mdsdb.task_final t1
on s.task=t1.sys_id and s.sourceinstance=t1.sourceinstance 
left join mercuryins_mdwdb.d_internal_organization l
ON ( COALESCE(CONCAT('GROUP','~',t1.assignment_group),'UNSPECIFIED')= l.row_id
 and s.sourceinstance=l.source_id)
WHERE COALESCE(l.row_key,CASE WHEN t1.assignment_group IS NULL THEN 0 else '-1' end)<>
 COALESCE(t.assignment_group_key,'')
) temp

