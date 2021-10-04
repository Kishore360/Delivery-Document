SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.ACTIVE_FLAG' ELSE 'SUCCESS' END as Message
   FROM mcd_mdsdb.incident_task_final i
join mcd_mdwdb.d_incident_task_c f on sys_id=f.row_id and sourceinstance=f.source_id where
IF(i.active = TRUE,'Y','N') <> f.ACTIVE_FLAG

