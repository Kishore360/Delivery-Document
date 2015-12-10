
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.problem_task_final s
left join asu_mdwdb.d_problem_task   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE convert_tz(s.sys_created_on,'GMT','US/Mountain') <> t.created_on) c


