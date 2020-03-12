

-----

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message FROM  
watson_mdwdb.d_task_tag_c a 
JOIN watson_mdsdb.label_entry_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT JOIN watson_mdsdb.label_final c
ON b.label = c.sys_id
LEFT JOIN watson_mdsdb.task_final e
ON b.table_key = e.sys_id
LEFT join watson_mdwdb.d_lov d
on d.row_id = COALESCE(CONCAT('TASK_TYPE~TASK~~~',UPPER(b.table)),'UNSPECIFIED')

where
a.task_type_src_key <> COALESCE(d.row_key,CASE WHEN b.table  IS NULL THEN 0 else -1 end);
