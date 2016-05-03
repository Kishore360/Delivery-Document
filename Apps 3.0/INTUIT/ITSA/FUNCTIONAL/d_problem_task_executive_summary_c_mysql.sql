SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdwdb.d_problem_task a 
 inner join intuit_mdsdb.problem_task_final b
 on b.sys_id=a.row_id and b.sourceinstance=a.source_id 
where a.executive_summary_c<>b.u_executive_summary ) temp