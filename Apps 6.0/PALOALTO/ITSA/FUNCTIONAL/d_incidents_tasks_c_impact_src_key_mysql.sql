SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_tasks_c.IMPACT_SRC_key' ELSE 'SUCCESS' END as Message
   FROM paloalto_mdsdb.u_incident_tasks_final i
 join paloalto_mdwdb.d_lov d on 
 CONCAT('IMPACT','~','INCIDENT','_','TASKS','~','~','~',UPPER(i.IMPACT))  =d.row_id
 join paloalto_mdwdb.d_incident_tasks_c f on sys_id=f.row_id and sourceinstance=f.source_id
 where f.IMPACT_SRC_key<>coalesce(d.row_key,case when IMPACT is null then 0 else -1 end)