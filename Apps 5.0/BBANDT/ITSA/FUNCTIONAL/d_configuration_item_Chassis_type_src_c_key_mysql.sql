

 
 SELECT 
 CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
 CASE WHEN CNT>0 THEN 'd_configuration_item.install_status_src_c_key is failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM bbandt_mdsdb.cmdb_ci_server_final SRC
 JOIN bbandt_mdwdb.d_configuration_item TRGT
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 JOIN bbandt_mdwdb.d_lov LKP
 ON ((COALESCE(CONCAT('CHASSIS_TYPE_C~CONFIGURATION_ITEM','~~~',UPPER(SRC.chassis_type)),'UNSPECIFIED'))=LKP.row_id
 AND SRC.sourceinstance=LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.chassis_type IS NULL THEN 0 ELSE -1 END)<>(TRGT.Chassis_type_src_c_key)
and SRC.cdctype='X')temp;