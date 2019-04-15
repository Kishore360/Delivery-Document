SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.time_left_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT	
 from tjxco_mdsdb.task_sla_final src  
left join tjxco_mdwdb.f_task_sla trgt1 on src.sys_id=trgt1.row_id and src.sourceinstance=trgt1.source_id	
where src.time_left <> trgt1.time_left_c )temp;