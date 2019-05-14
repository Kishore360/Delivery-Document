SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.end_time_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjxco_mdsdb.task_sla_final src 
JOIN tjxco_mdwdb.f_task_sla trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE CONVERT_TZ(src.end_time,'GMT','America/New_York')<>trgt.end_time_c and src.cdctype<>'D'
)temp;