SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_problem_task.due_date_count_c' ELSE 'SUCCESS' END as Message 
FROM
(
select count(1) as CNT from ibmwatson_mdsdb.problem_task_final src
left JOIN ibmwatson_mdwdb.f_problem_task tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join (select documentkey,count(1) as cnt from ibmwatson_mdsdb.sys_audit_final
where fieldname='due_date' and tablename='problem_task' and oldvalue is not null
group by 1) saf on saf.documentkey=src.sys_id
where coalesce(saf.cnt,0)<>tgt.due_date_count_c)der
