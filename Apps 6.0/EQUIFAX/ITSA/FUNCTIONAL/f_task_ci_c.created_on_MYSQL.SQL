SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_task_ci_c.created_on' ELSE 'SUCCESS' END as Message
FROM 
(select count(1)  as cnt FROM  equifax_mdsdb.task_ci_final SRC 
JOIN equifax_mdwdb.f_task_ci_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE convert_tz(SRC.sys_created_on,'GMT','America/New_York')<>TRGT.created_on
)temp;







