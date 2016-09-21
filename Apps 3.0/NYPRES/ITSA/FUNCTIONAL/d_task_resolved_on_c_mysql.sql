SELECT CASE WHEN SUM(RES.a) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN SUM(RES.a) >0 THEN 'MDS to DWH data validation failed for d_task.category_c_key' ELSE 'SUCCESS' END as Message  FROM
(SELECT count(1) as a
FROM   nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
JOIN nypres_mdsdb.incident_final SRC_INC
ON SRC.sys_id=SRC_INC.sys_id AND SRC.sourceinstance=SRC_INC.sourceinstance
WHERE CONVERT_TZ(SRC_INC.resolved_at,'GMT','America/New_York')<>resolved_on_c
UNION 
SELECT count(1) as a
FROM nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC  
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
JOIN nypres_mdsdb.change_request_final SRC_CHG
ON SRC.sys_id=SRC_CHG.sys_id AND SRC.sourceinstance=SRC_CHG.sourceinstance
WHERE CONVERT_TZ(SRC_CHG.closed_at,'GMT','America/New_York')<>resolved_on_c) RES