
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_.reassignment_count_c' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM nbcu_mdsdb.task_final src 
LEFT JOIN nbcu_mdwdb.d_task trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE COALESCE(src.reassignment_count,'UNSPECIFIED')<>trgt.reassignment_count_c
)temp;

