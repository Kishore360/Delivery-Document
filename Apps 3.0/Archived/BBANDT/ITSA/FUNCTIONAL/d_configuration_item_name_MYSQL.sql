 
 SELECT 
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item_name' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.cmdb_ci_final SRC 
 LEFT JOIN bbandt_mdwdb.d_configuration_item TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(SRC.name,'UNSPECIFIED')<>COALESCE(TRGT.name,'UNSPECIFIED') 