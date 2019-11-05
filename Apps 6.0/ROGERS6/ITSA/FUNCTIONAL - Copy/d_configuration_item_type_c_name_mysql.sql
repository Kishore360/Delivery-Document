SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_configuration_item_type_c.name' ELSE 'SUCCESS' END as Message
-- select distinct COALESCE(SRC.name,'UNSPECIFIED'),TRGT.name,SRC.cdctype
 FROM rogers_mdsdb.cmdb_rel_type_final  SRC  
JOIN rogers_mdwdb.d_configuration_item_type_c TRGT 
ON SRC.sys_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  COALESCE(SRC.name,'UNSPECIFIED')<>TRGT.name
and SRC.CDCTYPE='X';