SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan6_mdsdb.u_service_request_final s
left join pan6_mdwdb.f_service_request_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join pan6_mdwdb.d_service_request_c d
on t.service_request_c_key=d.row_key
LEFT JOIN pan6_mdwdb.d_calendar_date LKP 
on LKP.row_id = 
COALESCE(DATE_FORMAT(CONVERT_TZ(coalesce(s.closed_at,s.sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
JOIN pan6_mdwdb.d_lov_map dlm 
ON d.state_src_key = dlm.src_key
WHERE case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end  <> t.closed_on_key) temp