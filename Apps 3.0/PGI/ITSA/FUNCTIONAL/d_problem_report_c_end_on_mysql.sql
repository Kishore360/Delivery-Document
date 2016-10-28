SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from pgi_mdsdb.u_problem_report_request_final a
left JOIN  pgi_mdwdb.d_problem_report_c b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
left join pgi_mdsdb.problem_final c
on  a.u_problem = c.sys_id
where  CONVERT_TZ(c.u_end,'GMT','UTC')<>b.end_on )c

