SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan6_mdsdb.u_service_request_final s 
left join pan6_mdwdb.f_service_request_c f 
on s.sys_id=f.row_id and s.sourceinstance = f.source_id 
JOIN pan6_mdwdb.d_service_request_c a 
ON s.sys_id= a.row_id AND s.sourceinstance= a.source_id
JOIN   pan6_mdwdb.d_lov_map br 
ON  a.state_src_key = br.src_key AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
WHERE TIMESTAMPDIFF(SECOND, a.opened_on, COALESCE(a.last_resolved_on, a.closed_on)) <> f.current_age ) temp;
