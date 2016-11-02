SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from pgi_mdsdb.u_problem_report_request_final a
left JOIN  pgi_mdwdb.f_problem_report_c b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
left join pgi_mdsdb.u_external_incident_final  c
on  a.u_incident=c.sys_id
left join pgi_mdwdb.d_incident d
on coalesce(c.u_parent_ticket,'UNSPECIFIED')= d.row_id
where  d.row_key<>b.parent_external_incident_c_key 
and d.external_flag='Y')c



