SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.install_status_c_key' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN bbandt_mdwdb.d_configuration_item TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN bbandt_mdwdb.d_lov LKP 
 ON  LKP.dimension_class =  'INSTALL_STATUS_C~CONFIGURATION_ITEM' and (concat('INSTALL_STATUS_C~CONFIGURATION_ITEM~~~',upper(SRC.install_status))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.install_status IS NULL THEN 0 else -1 end)<> (TRGT.install_status_c_key); 