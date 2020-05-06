SELECT 
 CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
 CASE WHEN CNT>0 THEN 'd_configuration_item.device_type_c is failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM equifax_mdsdb.cmdb_ci_netgear_final SRC
 JOIN equifax_mdwdb.d_configuration_item TRGT
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
  WHERE  SRC.device_type <>TRGT.device_type_c and SRC.cdctype<>'D')temp;