
 
 SELECT 
 CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
 CASE WHEN CNT>0 THEN 'd_configuration_item.install_status_src_c_key is failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM gilead_mdsdb.cmdb_ci_final SRC
 JOIN gilead_mdwdb.d_configuration_item TRGT
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 JOIN gilead_mdwdb.d_lov LKP
 ON ((COALESCE(CONCAT('INSTALL_STATUS_C~CONFIGURATION_ITEM','~~~',UPPER(SRC.install_status)),'UNSPECIFIED'))=LKP.row_id
 AND SRC.sourceinstance=LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.install_status IS NULL THEN 0 ELSE -1 END)<>(TRGT.install_status_src_c_key))temp;