
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.pause_time_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM nbcu_mdsdb.task_sla_final a 
JOIN nbcu_mdwdb.f_task_sla b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE COALESCE(CONVERT_TZ(a.pause_time,'GMT','America/New_York'),'UNSPECIFIED')<>b.pause_time_c
)temp;