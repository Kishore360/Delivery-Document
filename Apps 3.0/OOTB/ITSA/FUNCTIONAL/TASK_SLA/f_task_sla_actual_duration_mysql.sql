SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message from 
<<tenant>>_mdsdb.task_sla_final tsd 
join <<tenant>>_mdwdb.f_task_sla a on a.row_id=tsd.sys_id and a.source_id=tsd.sourceinstance
where actual_duration<>
	CASE WHEN tsd.duration is null  THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',tsd.duration) < 0 THEN NULL
	  WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',tsd.duration) > 214748364 THEN NULL 
	  ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',tsd.duration) 
	  
