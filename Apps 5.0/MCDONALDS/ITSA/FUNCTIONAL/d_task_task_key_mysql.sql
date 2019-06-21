SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
mcdonalds_mdwdb.f_task_tag_c a 
JOIN mcdonalds_mdsdb.label_entry_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT JOIN mcdonalds_mdsdb.label_final c
ON b.label = c.sys_id
LEFT join mcdonalds_mdwdb.d_task d
on d.row_id = b.table_key

where
a.task_key <> COALESCE(d.row_key,CASE WHEN c.type IS NULL THEN 0 else -1 end);


