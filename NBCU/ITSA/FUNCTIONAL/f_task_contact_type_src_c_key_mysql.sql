
 SELECT (CONCAT('CONTACT_TYPE~TASK~~~',UPPER(CONTACT_TYPE))), (LKP.src_rowid ),
COALESCE(LKP.row_key,CASE WHEN SRC.CONTACT_TYPE IS NULL THEN 0 else -1 end),
 (TRGT.contact_type_src_c_key)
 FROM nbcu_mdsdb.task_final SRC
 LEFT JOIN nbcu_mdwdb.f_task_c TRGT 
 ON (SRC.sys_id ) =(TRGT.row_id ) 
 AND (SRC.sourceinstance )=(TRGT.source_id ) 
 LEFT JOIN nbcu_mdwdb.d_lov LKP 
 ON (CONCAT('CONTACT_TYPE~TASK~~~',UPPER(CONTACT_TYPE)))= (LKP.src_rowid )
 AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.CONTACT_TYPE IS NULL THEN 0 else -1 end)<>
 (TRGT.contact_type_src_c_key) ;