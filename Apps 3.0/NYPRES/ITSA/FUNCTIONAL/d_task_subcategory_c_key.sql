SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1)>0 THEN 'MDS to DWH data validation failed for d_task.subcategory_c_key' ELSE 'SUCCESS' END as Message
FROM   nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
JOIN nypres_mdsdb.incident_final SRC_INC
ON SRC.sys_id=SRC_INC.sys_id AND SRC.sourceinstance=SRC_INC.sourceinstance
JOIN nypres_mdwdb.d_lov LKP
ON LKP.row_id= CONCAT('SUBCATEGORY~INCIDENT~~~',UPPER(SRC_INC.subcategory))
WHERE COALESCE(LKP.row_key,CASE WHEN SRC_INC.subcategory  IS NULL THEN 0 ELSE -1 END)<>subcategory_c_key