SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_lov  lkp
on 
(CONCAT('PENDING_CODE','~','U_INCIDENT_TASK','~','~','~',UPPER(s.u_pending_code))
=lkp.row_id and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.u_pending_code IS NULL THEN 0 else -1 end) <> t.pending_code_src_key
) temp
