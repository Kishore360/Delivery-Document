
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.problem_task_final s
left join tivo_mdwdb.d_problem_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE convert_tz(s.u_actual_start_date,'GMT','America/Los_Angeles') <> t.actual_start_date_c
) temp

