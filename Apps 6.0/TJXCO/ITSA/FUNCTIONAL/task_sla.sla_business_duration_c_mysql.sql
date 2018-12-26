SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for task_sla.sla_business_duration_c' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
FROM tjxco_mdsdb.task_sla_final src 
left join tjxco_mdwdb.f_task_sla trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where CASE WHEN src.business_duration is null  THEN NULL   WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) 
< 0 THEN NULL    WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) > 
214748364 THEN NULL     ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) end=trgt.sla_business_duration_c)temp;