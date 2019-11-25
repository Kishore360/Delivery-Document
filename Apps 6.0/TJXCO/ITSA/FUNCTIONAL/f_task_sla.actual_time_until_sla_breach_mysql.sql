SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.actual_time_until_sla_breach' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
FROM tjxco_mdsdb.task_sla_final src 
left join tjxco_mdwdb.f_task_sla trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where CASE WHEN src.time_left is null  THEN NULL  
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.time_left)<0 THEN NULL    
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.time_left) > 214748364 THEN NULL
ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.time_left) end<>trgt.actual_time_until_sla_breach and src.cdctype<>'D')temp;