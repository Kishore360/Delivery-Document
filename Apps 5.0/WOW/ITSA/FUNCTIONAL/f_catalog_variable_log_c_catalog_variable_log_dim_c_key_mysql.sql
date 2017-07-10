SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.catalog_variable_log_final s
left join wow_mdwdb.f_catalog_variable_log_c  t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join wow_mdwdb.d_request_item l
on COALESCE(s.u_requested_item,'UNSPECIFIED')= l.row_id and s.sourceinstance=l.source_id
where t.catalog_variable_log_dim_c_key <> l.row_key
) temp

