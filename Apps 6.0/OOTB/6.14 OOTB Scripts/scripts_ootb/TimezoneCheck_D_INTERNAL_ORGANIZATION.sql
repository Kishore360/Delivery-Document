SELECT CASE WHEN count(1) <> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) <>0 THEN 'MDS to DWH data validation failed for d_internal_organization.changed_on' 
 ELSE 'SUCCESS' END as Message
  FROM  app_test.ds_internal_organization SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization TRGT 
 ON (SRC.row_id  =TRGT.row_id  
 AND SRC.source_id = TRGT.source_id  )
 WHERE convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <> 
 TRGT.created_on 
 and convert_tz(SRC.changed_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <> 
 TRGT.changed_on ;
