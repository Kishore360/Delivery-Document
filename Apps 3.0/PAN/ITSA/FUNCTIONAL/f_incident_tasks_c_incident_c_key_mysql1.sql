 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'MDS TO MDW DATA VALIDATION FAILED'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from pan_mdsdb.u_incident_tasks_final s
left join pan_mdwdb.f_incident_tasks_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join pan_mdwdb.d_incident_tasks_c lkp
on lkp.row_id =sys_id
AND lkp.source_id=s.sourceinstance
WHERE COALESCE(lkp.row_key,CASE WHEN s.sys_id IS NULL THEN 0 else -1 end) <> t.incident_c_key) temp


