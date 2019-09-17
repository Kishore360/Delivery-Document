SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.open_to_close_duration' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcdonalds_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN mcdonalds_mdwdb.d_lov_map lv_mp ON COALESCE(CONCAT('STATE~INCIDENT_TASK~~~',src.state),'UNSPECIFIED') = lv_mp.src_rowid AND lv_mp.dimension_wh_code <>'CLOSED'
-- JOIN (select source_id,max(lastupdated) as lastupdated FROM mcdonalds_workdb.d_o_data_freshness group by source_id) df ON src.sourceinstance = df.source_id
WHERE 0 <> trgt.open_to_close_duration

;