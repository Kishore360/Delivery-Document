
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task.parent_task_key' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC 
LEFT JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN molinahealth_mdwdb.d_task LKP ON (SRC.parent = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
WHERE LKP.row_key<> TRGT.parent_task_key
) a; 











 




   


