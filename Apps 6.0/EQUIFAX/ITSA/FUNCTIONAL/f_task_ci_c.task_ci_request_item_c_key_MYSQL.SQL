SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_task_ci_c.task_ci_request_item_c_key' ELSE 'SUCCESS' END as Message
FROM 
(select count(1)  as cnt FROM  equifax_mdsdb.task_ci_final SRC 
LEFT JOIN equifax_mdwdb.d_request_item LKP ON SRC.task=LKP.row_id AND SRC.sourceinstance=LKP.source_id
JOIN equifax_mdwdb.f_task_ci_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.task IS NULL THEN 0 ELSE -1 END )<>TRGT.task_ci_request_item_c_key
)temp;







