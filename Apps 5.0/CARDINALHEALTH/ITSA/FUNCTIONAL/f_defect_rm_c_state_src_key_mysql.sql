	 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
	 CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
	 FROM cardinalhealth_mdsdb.rm_defect_final SRC 
	 LEFT JOIN cardinalhealth_mdwdb.f_defect_rm_c TRGT 
	 ON (SRC.sys_id =TRGT.row_id  
	 AND SRC.sourceinstance= TRGT.source_id  )
	LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
	 ON COALESCE(CONCAT('STATE_C','~','RM_DEFECT','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')= LKP.row_id 
	AND SRC.sourceinstance= LKP.source_id
	 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end) <> (TRGT.state_src_key)