SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdwdb.f_task_sla a join
meritsa_mdsdb.task_sla_final task_sla on a.row_id=task_sla.sys_id and a.source_id=task_sla.sourceinstance
join meritsa_mdwdb.d_task_sla LKP
on coalesce(task_sla.task,'UNSPECIFIED')= LKP.row_id 
where coalesce(LKP.row_key,case when task_sla.task is null then 0 else -1 end) <>a.task_key