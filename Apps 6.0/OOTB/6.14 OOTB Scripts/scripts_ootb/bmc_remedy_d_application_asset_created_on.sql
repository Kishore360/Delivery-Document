
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.created_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_bmc_core_application_final WHERE datasetid = 'BMC.ASSET' AND CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON (concat('APPLICATION~', SRC.requestid)  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE convert_tz(SRC.createdate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <> TRGT.created_on 
