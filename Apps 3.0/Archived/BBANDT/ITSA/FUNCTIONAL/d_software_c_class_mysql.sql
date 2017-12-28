SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_software_c.class' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.cmdb_ci_spkg_final SRC 
 LEFT JOIN bbandt_mdsdb.sys_db_object_final SRC2 
 ON (SRC.sys_class_name=SRC2.name 
 and SRC.SourceInstance=SRC2.SourceInstance)
 LEFT JOIN bbandt_mdwdb.d_software_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  coalesce(SRC2.label,SRC.sys_class_name)<> TRGT.class