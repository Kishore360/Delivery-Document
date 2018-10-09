SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan_mdsdb.u_service_request_final s
left join pan_mdwdb.f_service_request_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join pan_mdwdb.d_service_request_c d
on t.service_request_c_key=d.row_key
LEFT JOIN pan_mdwdb.d_calendar_date LKP 
on LKP.row_id = 
COALESCE(DATE_FORMAT(CONVERT_TZ(coalesce(s.u_resolved_at,s.closed_at,s.sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')
JOIN pan_mdwdb.d_lov_map dlm 
ON d.state_src_key = dlm.src_key
WHERE d.soft_deleted_flag='N' and  dlm.dimension_wh_code in ('CLOSED','RESOLVED') and coalesce(LKP.row_key,case when coalesce(s.u_resolved_at,s.closed_at,s.sys_updated_on) is null then 0 else -1 end) <> t.last_resolved_on_key

) temp