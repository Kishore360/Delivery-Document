SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
ibmwatson_mdwdb.d_task_tag_c a 
JOIN ibmwatson_mdsdb.label_entry_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance and b.cdctype<>'D'
LEFT JOIN ibmwatson_mdsdb.label_final c
ON b.label = c.sys_id and c.sourceinstance = b.sourceinstance and c.cdctype<>'D'
LEFT JOIN ibmwatson_mdsdb.task_final e
ON b.table_key = e.sys_id and e.sourceinstance = b.sourceinstance and e.cdctype<>'D'
LEFT join ibmwatson_mdwdb.d_lov d
on d.row_id = COALESCE(CONCAT('viewable_by~LABEL~',c.viewable_by),'UNSPECIFIED')

where
a.viewable_by_src_c_key < COALESCE(d.row_key,CASE WHEN c.viewable_by IS NULL THEN 0 else -1 end);