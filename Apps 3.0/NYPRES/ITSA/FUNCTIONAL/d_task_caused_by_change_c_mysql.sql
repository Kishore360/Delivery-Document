SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'MDS to DWH data validation failed for d_task.category_c_key' ELSE 'SUCCESS' END as Message
FROM nypres_mdwdb.d_task TRGT
JOIN nypres_mdsdb.task_final SRC  
ON SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  AND TRGT.task_type='incident' AND SRC.sys_class_name='incident'
JOIN(
select COALESCE(LKP.row_key,CASE WHEN SRC_INC.caused_by IS NULL THEN 0 ELSE -1 END) as che,SRC_INC.sys_id,SRC_INC.sourceinstance FROM 
nypres_mdsdb.incident_final SRC_INC
JOIN nypres_mdwdb.d_change_request LKP
ON LKP.row_id = SRC_INC.caused_by and LKP.source_id=SRC_INC.sourceinstance) vals
ON TRGT.source_id = vals.sourceinstance and TRGT.row_id = vals.sys_id
WHERE vals.che <>TRGT.caused_by_change_c_key

