 
 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.closure_subcategory_src_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_hardware_final SRC 
  JOIN nypres_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nypres_mdwdb.d_lov LKP 
 ON ( CONCAT('HARDWARE_SUBSTATUS_C','~','CMDB_CI_HARDWARE','~~~',UPPER(hardware_substatus))= LKP.row_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.hardware_substatus IS NULL THEN 0 else -1 end)<> (TRGT.hardware_substatus_c_key) 
 
 
 