 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task.contact_type_src_key' ELSE 'SUCCESS' END as  Message
FROM (
SELECT COUNT(1) as CNT 
FROM tjxco_mdsdb.task_final b 
LEFT JOIN tjxco_mdwdb.d_task c ON b.sys_id=c.row_id and b.sourceinstance=c.source_id
LEFT JOIN tjxco_mdwdb.d_lov LKP ON (CONCAT('CONTACT_TYPE~TASK~',b.contact_type))=LKP.src_rowid
WHERE COALESCE(LKP.row_key,CASE WHEN b.contact_type IS NULL THEN 0 ELSE -1 END)=c.contact_type_src_key
)a;