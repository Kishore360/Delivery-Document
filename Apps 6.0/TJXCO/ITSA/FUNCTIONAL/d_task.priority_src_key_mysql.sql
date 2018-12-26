SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.priority_src_key' ELSE 'SUCCESS' END as Message
FROM 
( SELECT COALESCE(lkp.row_key,CASE WHEN a.priority IS NULL THEN 0 ELSE -1 END) , (trgt.priority_src_key) 
FROM  tjxco_mdsdb.task_final a 
JOIN tjxco_mdwdb.d_task trgt on a.sys_id=trgt.row_id and a.sourceinstance=trgt.source_id
left JOIN tjxco_mdwdb.d_lov lkp on CONCAT('PRIORITY','~','TASK','~',a.priority) = lkp.row_id AND a.sourceinstance =  lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN a.priority IS NULL THEN 0 ELSE -1 END) <> (trgt.priority_src_key) )temp