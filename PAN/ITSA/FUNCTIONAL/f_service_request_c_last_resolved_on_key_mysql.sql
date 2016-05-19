SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan_mdsdb.u_service_request_final s
left join pan_mdwdb.f_service_request_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN pan_mdwdb.d_calendar_date LKP 
on LKP.row_id = 
COALESCE(DATE_FORMAT(CONVERT_TZ(s.u_resolved_at,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
WHERE LKP.row_key <> t.last_resolved_on_key) temp