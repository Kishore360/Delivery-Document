SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1)>0 THEN 'MDS to DWH data validation failed for d_task.opened_by_c_key' ELSE 'SUCCESS' END as Message 
FROM   nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
JOIN nypres_mdwdb.d_internal_contact LKP 
ON  CONCAT('INTERNAL_CONTACT~',SRC.opened_by)= LKP.row_id  AND SRC.sourceinstance= LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by THEN 0 ELSE -1 END) <> TRGT.opened_by_c_key