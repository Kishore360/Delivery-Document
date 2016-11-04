SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM
pan_mdwdb.d_incident_tasks_c d 
JOIN   pan_mdwdb.f_incident_tasks_c f 
ON     d.row_key = f.incident_tasks_c_key 
AND    d.source_id=f.source_id
JOIN   pan_mdwdb.d_lov_map lov_map 
ON     d.state_src_key = lov_map.src_key 
WHERE  lov_map.dimension_class = 'STATE~TASK' 
AND   (case when lov_map.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END)<>d.backlog_flag