SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
FROM svb_mdsdb.cmdb_ci_final SRC 
LEFT JOIN svb_mdwdb.d_internal_organization LKP
 ON (SRC.support_group =LKP.row_id  
 AND SRC.sourceinstance= LKP.source_id  )
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where organization_name<>TRGT.support_group