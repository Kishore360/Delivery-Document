SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
mcdonalds_mdwdb_mdwdb.d_task_tag_c a 
JOIN mcdonalds_mdsdb_mdsdb.label_entry_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 

where
a.title <> b.title;








