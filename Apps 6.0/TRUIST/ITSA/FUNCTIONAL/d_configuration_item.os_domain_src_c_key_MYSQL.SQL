
  SELECT 
 CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
 CASE WHEN CNT>0 THEN 'd_configuration_item.install_status_src_c_key is failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM truist_mdsdb.cmdb_ci_server_final SRC
 JOIN truist_mdwdb.d_configuration_item TRGT
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 JOIN truist_mdwdb.d_lov LKP
 ON ((COALESCE(CONCAT('OS_DOMAIN_C~CONFIGURATION_ITEM','~',UPPER(SRC.os_domain)),'UNSPECIFIED'))=LKP.row_id
 AND SRC.sourceinstance=LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.os_domain IS NULL THEN 0 ELSE -1 END)<>TRGT.os_domain_src_c_key
 and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')temp;