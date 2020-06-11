 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.model_number' ELSE 'SUCCESS' END as Message
 FROM ( select * from #MDS_TABLE_SCHEMA.hlx_bmc_core_application_final where  datasetid = 'BMC.ASSET')  SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON  (concat('APPLICATION~',SRC.RequestId)  =TRGT.row_id  
 and SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(case when SRC.cdctype = 'D' then 'Y' else 'N' end,'')<> COALESCE(TRGT.soft_deleted_flag,'');