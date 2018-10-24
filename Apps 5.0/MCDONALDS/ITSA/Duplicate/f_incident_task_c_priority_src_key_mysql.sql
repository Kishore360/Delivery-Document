SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mcdonalds_mdsdb.u_incident_task_final s
left join mcdonalds_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join mcdonalds_mdwdb.d_lov lkp
on 
(CONCAT('PRIORITY','~','INCIDENT_TASK','~','~','~',UPPER(s.priority))
=lkp.row_id and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.priority IS NULL THEN 0 else -1 end) <> t.priority_src_key 
) x