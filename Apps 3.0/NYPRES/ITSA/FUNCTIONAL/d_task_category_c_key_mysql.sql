SELECT CASE WHEN SUM(RES.a) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN SUM(RES.a) >0 THEN 'MDS to DWH data validation failed for d_task.category_c_key' ELSE 'SUCCESS' END as Message  FROM
(SELECT count(1) as a
FROM   nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC 
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
JOIN nypres_mdsdb.incident_final SRC_INC
ON SRC.sys_id=SRC_INC.sys_id AND SRC.sourceinstance=SRC_INC.sourceinstance
JOIN nypres_mdwdb.d_lov LKP
ON LKP.row_id= CONCAT('CATEGORY~INCIDENT~~~',UPPER(SRC_INC.category))
WHERE COALESCE(LKP.row_key,CASE WHEN SRC_INC.category  IS NULL THEN 0 ELSE -1 END)<>category_c_key
UNION 
SELECT count(1) as a
FROM nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC  
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  
JOIN nypres_mdsdb.change_request_final SRC_CHG
ON SRC.sys_id=SRC_CHG.sys_id AND SRC.sourceinstance=SRC_CHG.sourceinstance
JOIN nypres_mdwdb.d_lov LKP
ON LKP.row_id= CONCAT('CATEGORY~CHANGE_REQUEST~~~',UPPER(SRC_CHG.category))
WHERE COALESCE(LKP.row_key,CASE WHEN SRC_CHG.category  IS NULL THEN 0 ELSE -1 END)<>category_c_key) RES