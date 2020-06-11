SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.device_name' ELSE 'SUCCESS' END as Message
 FROM ( select * from #MDS_TABLE_SCHEMA.hlx_bmc_core_baseelement_final where datasetid = 'BMC.ASSET' and classid <> 'BMC_PERSON' ) SRC
left join #DWH_TABLE_SCHEMA.d_configuration_item TRGT
ON (SRC.requestid=TRGT.row_id  
AND SRC.SourceInstance =TRGT.source_id )
where coalesce(SRC.name,'')<>coalesce(TRGT.device_name,'')