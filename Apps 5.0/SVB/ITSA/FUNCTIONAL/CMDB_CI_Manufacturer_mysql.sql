

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN svb_mdsdb.core_company_final SRC1 on SRC.manufacturer=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC1.name,'')<> COALESCE(TRGT.manufacturer,'')

 
 