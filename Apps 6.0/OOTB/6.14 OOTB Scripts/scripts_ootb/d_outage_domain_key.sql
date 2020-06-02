SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.domain_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item SRC2
 ON(SRC.cmdb_ci  =SRC2.row_id  
 AND SRC.sourceinstance = SRC2.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_domain LKP 
 ON ( SRC2.domain_key = LKP.row_key 
AND SRC2.source_id = LKP.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE TRGT.soft_deleted_flag = 'N'
 and COALESCE(LKP.row_key,CASE WHEN LKP.domain_name IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.domain_key,'')