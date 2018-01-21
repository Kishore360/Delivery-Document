SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.priority_src_key' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT count(1) as CNT 
FROM tjx_mdsdb.task_sla_final a 
JOIN 
(SELECT *,CONCAT('PRIORITY','~','TASK','~','~','~',UPPER(priority)) as jn1 FROM tjx_mdsdb.task_final) src 
ON (a.task=src.sys_id and a.sourceinstance=src.sourceinstance)
JOIN (SELECT *, DATE_FORMAT(pivot_date,'%Y-%m-%d %H:%i:%s') as jn2 FROM tjx_mdwdb.f_task_c) trgt 
ON (src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id)
JOIN tjx_mdwdb.d_lov lkp 
ON (src.jn1=lkp.row_id AND src.sourceinstance=lkp.source_id) AND trgt.jn2 BETWEEN effective_from AND effective_to
WHERE 
COALESCE(lkp.row_key,CASE WHEN src.priority IS NULL THEN 0 ELSE -1 END) <> (trgt.priority_src_key)
)temp;

 