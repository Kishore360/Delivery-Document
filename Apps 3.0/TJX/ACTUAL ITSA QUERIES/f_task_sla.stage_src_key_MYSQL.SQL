
 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.stage_src_key' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT count(1) as CNT 
FROM tjx_mdsdb.task_sla_final a 
JOIN tjx_mdwdb.f_task_sla b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
JOIN tjx_mdwdb.d_lov LKP 
ON COALESCE(CONCAT('STAGE','~','TASK_SLA','~','~','~',UPPER(a.stage)),'UNSPECIFIED')=LKP.row_id
AND a.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN a.stage IS NULL THEN 0 ELSE -1 END)<>b.stage_src_key
)temp;