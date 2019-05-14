SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.contact_type_src_c_key' ELSE 'SUCCESS' END as  Message
FROM (
SELECT COUNT(1) as CNT 
FROM tjx_mdsdb.task_final SRC 
LEFT JOIN tjx_mdwdb.f_task_c TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
LEFT JOIN tjx_mdwdb.d_lov LKP ON (CONCAT('CONTACT_TYPE~TASK~~~',SRC.contact_type))=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 ELSE -1 END)<>TRGT.contact_type_src_c_key
 and SRC.sys_class_name='incident'
 )ma;





