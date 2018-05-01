SELECT 
	   CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
	   CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task.last_resolved_on_key' ELSE 'SUCCESS' END as Message FROM
(
SELECT 
 IF(lv_mp.dimension_wh_code IN ('RESOLVED','CLOSED'),CONVERT_TZ(inc.resolved_at,'GMT','America/New_York'),NULL) ,,trgt.last_resolved_on_c,
 lv_mp.dimension_wh_code,inc.resolved_at,trgt.row_id
FROM tjx_mdwdb.d_task trgt
RIGHT JOIN tjx_mdsdb.task_final src
ON trgt.row_id = src.sys_id AND trgt.source_id = src.sourceinstance
JOIN tjx_mdsdb.incident_final inc
ON src.sys_id = inc.sys_id AND src.sourceinstance = inc.sourceinstance
JOIN tjx_mdwdb.d_lov_map lv_mp
ON COALESCE(CONCAT('STATE~INCIDENT~~~',inc.state),'UNSPECIFIED') = lv_mp.src_rowid 
WHERE IF(lv_mp.dimension_wh_code IN ('RESOLVED','CLOSED'),CONVERT_TZ(inc.resolved_at,'GMT','America/New_York'),NULL) <> trgt.last_resolved_on_c

UNION ALL

SELECT 
IF(lv_mp.dimension_wh_code IN ('RESOLVED','CLOSED'),CONVERT_TZ(sc_tsk.closed_at,'GMT','America/New_York'),NULL) ,
 trgt.last_resolved_on_c,lv_mp.dimension_wh_code,sc_tsk.closed_at,  trgt.row_id
FROM tjx_mdwdb.d_task trgt
RIGHT JOIN tjx_mdsdb.task_final src
ON trgt.row_id = src.sys_id AND trgt.source_id = src.sourceinstance
JOIN tjx_mdsdb.sc_task_final sc_tsk
ON src.sys_id = sc_tsk.sys_id AND src.sourceinstance = sc_tsk.sourceinstance
JOIN tjx_mdwdb.d_lov_map lv_mp
ON COALESCE(CONCAT('STATE~SC_TASK~~~',sc_tsk.state),'UNSPECIFIED') = lv_mp.src_rowid 
WHERE IF(lv_mp.dimension_wh_code IN ('RESOLVED','CLOSED'),CONVERT_TZ(sc_tsk.closed_at,'GMT','America/New_York'),NULL) <> trgt.last_resolved_on_c

UNION ALL

SELECT 
IF(lv_mp.dimension_wh_code IN ('RESOLVED','CLOSED','UNSPECIFIED'), CONVERT_TZ(src.closed_at,'GMT','America/New_York'),NULL) , 
trgt.last_resolved_on_c,lv_mp.src_rowid ,lv_mp.dimension_wh_code,src.closed_at,
trgt.row_id
FROM tjx_mdwdb.d_task trgt
JOIN tjx_mdsdb.task_final src
ON trgt.row_id = src.sys_id AND trgt.source_id = src.sourceinstance and sys_class_name  NOT IN ('incident','sc_task')

JOIN tjx_mdwdb.d_lov_map lv_mp
ON COALESCE(CONCAT('STATE~TASK~~~',src.state),'UNSPECIFIED') = lv_mp.src_rowid 
WHERE IF(lv_mp.dimension_wh_code IN ('RESOLVED','CLOSED','UNSPECIFIED'), CONVERT_TZ(src.closed_at,'GMT','America/New_York'),NULL) <> trgt.last_resolved_on_c
) A
;