SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message from 
mercuryins_mdsdb.task_sla_final task_sla 
left join mercuryins_mdsdb.cmn_schedule_final c on task_sla.schedule=c.sys_id and task_sla.sourceinstance =c.sourceinstance
join mercuryins_mdwdb.f_task_sla a on task_sla.sys_id=task_sla.sys_id and a.source_id=task_sla.sourceinstance
where 
a.task_key<>coalesce(case when task_sla.task is null then 0 else -1 end);

