SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
ibmwatson_mdwdb.d_task_tag_c a 
JOIN ibmwatson_mdsdb.label_entry_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT JOIN ibmwatson_mdsdb.label_final c
ON b.label = c.sys_id
LEFT join ibmwatson_mdwdb.d_lov d
on d.row_id = COALESCE(CONCAT('TYPE~LABEL~~~',c.type),'UNSPECIFIED')

where
a.tag_type_src_c_key <> COALESCE(d.row_key,CASE WHEN c.type IS NULL THEN 0 else -1 end);