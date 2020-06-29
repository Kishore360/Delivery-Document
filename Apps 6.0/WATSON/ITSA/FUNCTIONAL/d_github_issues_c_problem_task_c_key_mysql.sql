SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_github_issues_c.problem_task_c_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from ibmwatson_mdsdb.u_github_issues_final s
left join ibmwatson_mdwdb.d_problem_task d on s.u_problem_task=d.row_id and s.sourceinstance=d.source_id
left join  ibmwatson_mdwdb.d_github_issues_c t on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where t.problem_task_c_key<>coalesce(d.row_key,case when s.u_problem_task is null then 0 else -1 end))a;