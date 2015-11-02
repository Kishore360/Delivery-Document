SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.problem_task_final a
left join intuit_mdwdb.d_problem_task c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where 
c.met_sla_flag <> CASE WHEN(IF(a.u_due_date_extended_count > 0, 0, IF (c.closed_on > c.due_on, 0, 1)))=1 THEN 'Y'
ELSE 'N' END
) g