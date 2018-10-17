SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.ACTIVE_FLAG' ELSE 'SUCCESS' END as Message
   FROM paloalto_mdsdb.u_incident_tasks_final i
join paloalto_mdwdb.d_incident_tasks_c f on sys_id=f.row_id and sourceinstance=f.source_id where
IF(i.active = TRUE,'Y','N') <> f.ACTIVE_FLAG