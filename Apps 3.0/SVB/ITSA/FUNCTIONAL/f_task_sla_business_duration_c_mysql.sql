SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 	
svb_mdsdb.task_sla_final tsd
JOIN svb_mdwdb.f_task_sla stg
ON stg.row_id = tsd.sys_id AND stg.source_id = tsd.sourceinstance
where stg.business_duration_c <> TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',tsd.business_duration)

