SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_software_c.short_description' ELSE 'SUCCESS' END as Message
 -- select SRC.short_description,TRGT.short_desc,SRC.cdctype
 FROM truist_mdsdb.cmdb_model_final SRC 
 LEFT JOIN truist_mdwdb.d_product_model TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.short_description,'UNSPECIFIED')<> TRGT.short_desc
 and SRC.cdctype='X'
 
 
