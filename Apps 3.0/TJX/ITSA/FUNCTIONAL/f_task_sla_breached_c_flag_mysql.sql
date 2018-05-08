SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.breached_c_flag' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjx_mdsdb.task_sla_final src 
LEFT JOIN tjx_mdwdb.f_task_sla trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE  case when src.has_breached = 1 then 'Y' else 'N' end <> trgt.breached_c_flag )temp;