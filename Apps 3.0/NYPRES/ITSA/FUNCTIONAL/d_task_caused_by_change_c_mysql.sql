SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'MDS to DWH data validation failed for d_task.category_c_key' ELSE 'SUCCESS' END as Message
FROM nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC  
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  AND TRGT.task_type='incident'
JOIN nypres_mdsdb.incident_final SRC_INC
ON TRGT.row_id=SRC_INC.sys_id AND TRGT.source_id=SRC_INC.sourceinstance
JOIN nypres_mdwdb.d_change_request LKP
ON LKP.row_id = SRC_INC.caused_by
WHERE COALESCE(LKP.row_key,CASE WHEN SRC_INC.caused_by IS NULL THEN 0 ELSE -1 END) <> TRGT.caused_by_change_c_key