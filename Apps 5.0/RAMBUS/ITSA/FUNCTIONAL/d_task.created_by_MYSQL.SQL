


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task.created_by' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM rambus_mdsdb.task_final a
JOIN rambus_mdwdb.d_task b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
WHERE a.sys_created_by<>b.created_by
)temp;


 