
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from ibmwatson_mdsdb.u_github_issues_final s
join ibmwatson_mdwdb.d_github_issues_c t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join ibmwatson_mdwdb.d_github_issues_c l 
on s.u_problem=l.row_id and s.sourceinstance=l.source_id
WHERE coalesce(l.row_key,case when s.u_problem is null then 0 else -1 end)  <> t.github_issues_problem_task_parent_c_key
) temp