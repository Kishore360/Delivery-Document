SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.timezone_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM 
tjxco_mdsdb.task_sla_final src1
LEFT JOIN tjxco_mdwdb.f_task_sla trgt ON src1.sys_id=trgt.row_id and src1.sourceinstance=trgt.source_id
WHERE src1.timezone<>trgt.timezone_c )temp;