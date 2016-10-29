SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from pgi_mdsdb.u_problem_report_request_final a
 left join pgi_mdwdb.d_incident c
on a.u_suggested_parent_incident=c.row_id
 left JOIN  pgi_mdwdb.f_problem_report_c b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
where  c.row_key<>b.suggested_parent_internal_incident_c_key )c


