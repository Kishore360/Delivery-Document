SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_calendar_date lkp
on lkp.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.u_actual_resolve_date,'GMT' ,'America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
LEFT JOIN intuit_mdwdb.d_lov_map br 
 ON t.state_src_key = br.src_key
WHERE  case when br.dimension_wh_code IN ('OPEN') THEN 0 ELSE 
 lkp.row_key end  <> t.last_resolved_on_key) temp