SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.priority_src_key' ELSE 'SUCCESS' END as Message
FROM 
( SELECT count(1) as CNT 
FROM tjx_mdsdb.task_final src
JOIN tjx_mdwdb.f_task_c trgt 
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
JOIN tjx_mdwdb.d_lov lkp 
on CONCAT('PRIORITY','~','TASK','~','~','~',UPPER(src.priority)) = lkp.row_id AND src.sourceinstance =  lkp.source_id
COALESCE(lkp.row_key,CASE WHEN src.priority IS NULL THEN 0 ELSE -1 END) <> (trgt.priority_src_key) )temp;

 