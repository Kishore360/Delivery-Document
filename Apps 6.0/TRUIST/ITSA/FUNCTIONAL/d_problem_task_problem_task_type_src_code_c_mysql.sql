
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from truist_mdsdb.problem_task_final s
join truist_mdwdb.d_problem_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE s.u_problem_task_type  <> t.problem_task_type_src_code_c
) temp



