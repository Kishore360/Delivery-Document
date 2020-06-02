SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.purchase_date' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
 left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_db_object_final WHERE CDCTYPE<>'D') SRC2
 on SRC.sys_class_name = SRC2.name 
and SRC.sourceinstance = SRC2.sourceinstance 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  WHERE COALESCE( convert_tz(SRC.purchase_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') ,'')<> COALESCE(TRGT.purchase_date ,'')
