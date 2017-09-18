
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.cmdb_ci_final SRC
 LEFT JOIN whirlpool_mdsdb.sys_db_object_final sdof ON SRC.sys_class_name=sdof.name
and SRC.SourceInstance=sdof.SourceInstance

LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%OPERATIONAL_STATUS~CMDB_CI%' and 
( concat('OPERATIONAL_STATUS~CMDB_CI~~~',OPERATIONAL_status)= LKP.src_rowid 
 ) 
  JOIN whirlpool_mdwdb.f_configuration_item_aggregator_fact_c TRGT 
 ON (sdof.label =TRGT.ci_class_c  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  -- n_date='2017-09-04 00:00:00' and 
 TRGT.soft_deleted_flag='N' and 
 COALESCE(LKP.row_key,CASE WHEN SRC.OPERATIONAL_status IS NULL THEN 0 else -1 end)<> (TRGT.OPERATIONAL_status_src_c_key) ;