

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
, t.actual_duration_c
from tivo_mdsdb.problem_task_final s
left join tivo_mdwdb.f_problem_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE (timestampdiff(second,'1970-01-01 00:00:00',s.u_actual_duration))
<> t.actual_duration_c
) temp