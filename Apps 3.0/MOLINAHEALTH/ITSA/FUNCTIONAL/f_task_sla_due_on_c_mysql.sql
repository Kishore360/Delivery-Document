

	
	
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 	
molinahealth_mdsdb.task_sla_final tsd
JOIN molinahealth_mdwdb.f_task_sla stg
ON stg.row_id = tsd.sys_id AND stg.source_id = tsd.sourceinstance
where stg.due_on_c <> convert_tz(tsd.Planned_end_time,'GMT','America/Los_Angeles')


