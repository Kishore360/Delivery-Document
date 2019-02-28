SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_sla.sla_duration' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
FROM tjxco_mdsdb.contract_sla_final src 
left join tjxco_mdwdb.d_task_sla trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where CASE WHEN src.duration is null  THEN NULL   WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration)<0 THEN NULL    
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration) > 
214748364 THEN NULL    ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration) end<>trgt.sla_duration)temp;