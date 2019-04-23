SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_task_sla a join
mercuryins_mdsdb.task_sla_final task_sla on a.row_id=task_sla.sys_id and a.source_id=task_sla.sourceinstance
join mercuryins_mdsdb.task_final  c on c.sys_id=task_sla.task and c.sourceinstance=task_sla.sourceinstance
join mercuryins_mdwdb.d_internal_organization LKP
on coalesce(concat('GROUP~',c.assignment_group),'UNSPECIFIED' )= LKP.row_id 
where coalesce(LKP.row_key,case when c.assignment_group is null then 0 else -1 end) <>a.assignment_group_key