SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.closed_by_key' ELSE 'SUCCESS' END as Message 
-- select src.number,COALESCE(CONCAT('STATE~INCIDENT_TASK~~~',src.state),'UNSPECIFIED'),lv_mp.src_rowid,lv_mp.dimension_wh_code,trgt.closed_by_key
FROM mcd_mdwdb.f_incident_task_c trgt
 JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_lov_map lv_mp ON COALESCE(CONCAT('STATE~INCIDENT_TASK~~~',src.state),'UNSPECIFIED') = lv_mp.src_rowid 
WHERE( 0 <> trgt.closed_by_key) AND lv_mp.dimension_wh_code ='OPEN';