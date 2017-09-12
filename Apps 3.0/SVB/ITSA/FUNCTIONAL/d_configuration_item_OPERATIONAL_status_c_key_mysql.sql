
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.cmdb_ci_final SRC
LEFT JOIN svb_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%OPERATIONAL_STATUS~CMDB_CI%' and 
( concat('OPERATIONAL_STATUS~CMDB_CI~~~',OPERATIONAL_status)= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.OPERATIONAL_status IS NULL THEN 0 else -1 end)<> (TRGT.OPERATIONAL_status_c_key)


 
 
 d_configuration_item_OPERATIONAL_status_c_key_mysql.sql