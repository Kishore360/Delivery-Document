SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from pgi_mdsdb.problem_final a

left join pgi_mdwdb.d_problem b

on a.sys_id=b.row_id and

a.sourceinstance=b.source_id

where a.u_rfc_jira_ticket<>b.rfc_jira_ticket_c) a;