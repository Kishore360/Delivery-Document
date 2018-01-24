
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task.task_type' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC 
LEFT JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.sys_class_name,'')<> TRGT.task_type
) a; 

