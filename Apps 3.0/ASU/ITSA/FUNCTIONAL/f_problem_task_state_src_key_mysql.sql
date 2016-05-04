


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.problem_task_final s
left join asu_mdwdb.f_problem_task   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join asu_mdwdb.d_lov l
on concat('STATE~TASK~~~',upper(s.state))=l.row_id and s.sourceinstance=l.source_id
where l.row_key <> t.state_src_key) temp