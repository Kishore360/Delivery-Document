
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.m2m_kb_task_final src
join intuit_mdsdb.task_final lkp1
on lkp1.sys_id= src.task and src.sourceinstance=lkp1.sourceinstance
left join intuit_mdwdb.f_kb_task_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_problem_task lkp
on src.task = lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_Key,case when lkp1.sys_class_name <>'problem_task'
then 0 else -1 end) <> tgt.problem_task_key
) temp