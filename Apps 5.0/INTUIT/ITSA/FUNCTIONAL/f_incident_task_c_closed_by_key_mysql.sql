SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN intuit_mdwdb.d_lov_map L
 ON (t.state_src_key = L.src_key)
left join intuit_mdwdb.d_internal_contact lkp

on lkp.row_id = COALESCE(CONCAT('INTERNAL_CONTACT~',s.closed_by),'UNSPECIFIED')
and lkp.source_id=t.source_id

WHERE case when L.dimension_wh_code = 'CLOSED' then (lkp.row_key) else null end  <> t.closed_by_key) temp