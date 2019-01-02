SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task.task_key' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT count(1) as CNT 
FROM tjxco_mdsdb.task_sla_final a1
join tjxco_mdsdb.task_final a on a1.task=a.sys_id and a1.sourceinstance=a.sourceinstance
JOIN tjxco_mdwdb.f_task b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
join tjxco_mdwdb.d_task lkp on a1.task=lkp.row_id and a1.sourceinstance=lkp.source_id
WHERE coalesce(lkp.row_key, case when a1.task is null then 0 else -1 end)<>b.task_key
)temp;