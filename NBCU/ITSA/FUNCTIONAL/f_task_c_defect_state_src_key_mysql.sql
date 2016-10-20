

 SELECT *
 FROM nbcu_mdsdb.task_final SRC
 LEFT JOIN nbcu_mdwdb.f_task_c TRGT 
 ON (SRC.sys_id ) =(TRGT.row_id ) 
 AND (SRC.sourceinstance )=(TRGT.source_id ) 
 LEFT JOIN nbcu_mdwdb.d_lov LKP 
 ON (CONCAT('STATE~RM_DEFECT~~~',UPPER(SRC.state)))= (LKP.src_rowid )
 AND SRC.sourceinstance= LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key) 
and TRGT.task_type='rm_defect';