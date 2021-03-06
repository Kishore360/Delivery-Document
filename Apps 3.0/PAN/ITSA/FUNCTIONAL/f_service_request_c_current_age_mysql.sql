SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan_mdsdb.u_service_request_final s 
left join pan_mdwdb.f_service_request_c f 
on s.sys_id=f.row_id and s.sourceinstance = f.source_id 
JOIN pan_mdwdb.d_service_request_c a 
ON s.sys_id= a.row_id AND s.sourceinstance= a.source_id
JOIN   pan_mdwdb.d_lov_map br 
ON  a.state_src_key = br.src_key AND br.dimension_wh_code = 'OPEN' 
WHERE TIMESTAMPDIFF(second,a.opened_on,(SELECT MAX(lastupdated) AS lastupdated
FROM pan_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')) <> f.current_age ) temp
