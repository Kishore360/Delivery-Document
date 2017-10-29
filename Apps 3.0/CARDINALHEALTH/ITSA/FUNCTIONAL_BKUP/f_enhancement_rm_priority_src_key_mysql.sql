SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.rm_enhancement_final SRC
 LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm TRGT
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP
 ON (CONCAT('PRIORITY','~','TASK','~','~','~',UPPER(SRC.priority))= LKP.src_rowid
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key))temp;
