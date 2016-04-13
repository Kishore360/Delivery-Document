
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.problem_task_final s
left join tivo_mdwdb.d_problem_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE case when s.u_communicated_to_MSO = 0 then 'N' else 'Y' end = t.communicated_to_MSO_c_flag
) temp


