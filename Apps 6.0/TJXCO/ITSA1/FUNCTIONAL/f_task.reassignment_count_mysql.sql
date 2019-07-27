SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task.reassignment_count' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT
 from tjxco_mdsdb.incident_final src  
LEFT JOIN tjxco_mdwdb.f_incident trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join tjxco_mdwdb.f_task trgt1 on trgt1.task_key=trgt.row_key	
where src.reassignment_count <> trgt.reassignment_count and src.cdctype and trgt.soft_deleted_flag='N')temp;