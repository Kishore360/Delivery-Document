SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.cmdb_ci_final SRC 
LEFT JOIN svb_mdsdb.cmdb_model_final LKP
 ON (SRC.model_id =LKP.sys_id  
 AND SRC.sourceinstance= LKP.sourceinstance  )
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where display_name<>model_id_c
