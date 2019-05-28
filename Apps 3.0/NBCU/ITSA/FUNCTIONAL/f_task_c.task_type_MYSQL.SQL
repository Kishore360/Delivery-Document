
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_c.task_type' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as cnt  
FROM nbcu_mdsdb.task_final a 
left JOIN nbcu_mdwdb.f_task_c b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE COALESCE(a.sys_class_name,'UNSPECIFIED')<>(b.task_type) and b.soft_deleted_flag='N'
)temp;

