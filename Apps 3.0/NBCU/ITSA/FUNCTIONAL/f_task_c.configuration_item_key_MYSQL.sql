SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.configuration_item_key' ELSE 'SUCCESS' END as  Message
FROM (
SELECT count(1) as CNT  
FROM nbcu_mdsdb.task_sla_final a 
JOIN nbcu_mdsdb.task_final b ON a.task=b.sys_id and a.sourceinstance=b.sourceinstance
JOIN nbcu_mdwdb.f_task_c c ON b.sys_id=c.row_id and b.sourceinstance=c.source_id
JOIN nbcu_mdwdb.d_configuration_item LKP ON COALESCE(b.cmdb_ci,'UNSPECIFIED')=LKP.row_id AND  b.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN b.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>c.configuration_item_key
)a;

