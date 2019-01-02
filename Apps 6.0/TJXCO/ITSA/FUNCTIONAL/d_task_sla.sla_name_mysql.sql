SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
	CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task_sla.sla_name' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from tjxco_mdsdb.contract_sla_final src
join tjxco_mdsdb.task_sla_final b on src.sys_id=b.sla
join tjxco_mdwdb.d_task_sla trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where coalesce(src.name,'UNSPECIFIED') <> trgt.sla_name) temp ;