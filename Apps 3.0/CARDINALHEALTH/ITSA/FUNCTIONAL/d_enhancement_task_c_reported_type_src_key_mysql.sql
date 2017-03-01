SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.u_enhancement_task_final SRC
  JOIN cardinalhealth_mdwdb.d_enhancement_task_c TRGT
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id)
 JOIN cardinalhealth_mdwdb.d_lov LKP
 ON COALESCE(CONCAT('CONTACT_TYPE_C','~','ENHANCEMENT_TASK','~','~','~',UPPER(contact_type)),'UNSPECIFIED')= LKP.src_rowid
AND SRC.sourceinstance= LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end) <> (TRGT.reported_type_src_key))temp;


