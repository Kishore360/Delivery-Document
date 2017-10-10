SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.contact_type_src_c_key' ELSE 'SUCCESS' END as  Message
FROM (
SELECT COUNT(1) as CNT 
FROM nbcu_mdsdb.task_final b 
LEFT JOIN nbcu_mdwdb.f_task_c c ON b.sys_id=c.row_id and b.sourceinstance=c.source_id
LEFT JOIN nbcu_mdwdb.d_lov LKP ON (CONCAT('CONTACT_TYPE~TASK~~~',b.contact_type))=LKP.src_rowid
WHERE COALESCE(LKP.row_key,CASE WHEN b.contact_type IS NULL THEN 0 ELSE -1 END)<>c.contact_type_src_c_key
)a;





