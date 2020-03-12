
---- 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
watson_mdwdb.d_task_tag_c a 
JOIN watson_mdsdb.label_entry_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 
LEFT JOIN watson_mdsdb.label_final c
ON b.label = c.sys_id

where
a.tag_name <> c.name and b.CDCTYPE <>'D';