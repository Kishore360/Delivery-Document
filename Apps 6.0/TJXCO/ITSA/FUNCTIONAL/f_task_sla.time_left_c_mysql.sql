SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.time_left_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT	
 from tjxco_mdsdb.task_sla_final src  
left join tjxco_mdwdb.f_task_sla trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id	
where src.time_left <> trgt.time_left_c )temp;