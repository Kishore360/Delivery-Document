
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.timzone_c' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM nbcu_mdsdb.task_final a 
JOIN nbcu_mdsdb.task_sla_final b ON a.sys_id=b.task and a.sourceinstance=b.sourceinstance
JOIN nbcu_mdwdb.f_task_sla c ON b.sys_id=c.row_id and b.sourceinstance=c.source_id
WHERE COALESCE(b.timezone,'UNSPECIFIED')<>c.timzone_c
)temp;

