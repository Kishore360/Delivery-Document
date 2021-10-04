SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.age' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN mcd_mdwdb.d_lov_map lv_mp ON COALESCE(CONCAT('STATE~INCIDENT_TASK~~~',src.state),'UNSPECIFIED') = lv_mp.src_rowid AND lv_mp.dimension_wh_code ='CLOSED'

WHERE IF(CONVERT_TZ(src.opened_at,'GMT','US/Central') < CONVERT_TZ(src.closed_at,'GMT','US/Central') , TIMESTAMPDIFF(SECOND,CONVERT_TZ(src.opened_at,'GMT','US/Central'),CONVERT_TZ(src.closed_at,'GMT','US/Central')),0) <> trgt.age
;