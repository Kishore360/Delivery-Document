SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.criticality_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_service_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_service TRGT 
 ON (concat('BUSINESS_SERVICE~',SRC.sys_id)  =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP
 ON (upper(concat('CRITICALITY~BUSINESS_SERVICE~',SRC.busines_criticality))  =LKP.src_rowid  
 AND SRC.sourceinstance = LKP.source_id  )
 
 WHERE COALESCE( LKP.row_key,CASE WHEN SRC.busines_criticality IS NULL THEN 0 ELSE -1 END)<> COALESCE(TRGT.criticality_key ,'')

 
 