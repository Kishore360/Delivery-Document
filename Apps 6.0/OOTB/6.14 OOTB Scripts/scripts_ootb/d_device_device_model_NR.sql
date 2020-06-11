SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_device.device_model' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.Mobile_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_device TRGT 
 ON CONCAT(SRC.device, '~', SRC.deviceModel, '~', SRC.osVersion,'~',SRC.deviceType)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
 WHERE COALESCE(SRC.deviceModel, '')<> COALESCE(TRGT.device_model,'');
 
 