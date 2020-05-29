SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_device.device_type_key' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.Mobile_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_device TRGT 
 ON CONCAT(SRC.device, '~', SRC.deviceModel, '~', SRC.osVersion,'~',SRC.deviceType)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
 left join #DWH_TABLE_SCHEMA.d_lov lov
 on lov.row_id = CONCAT('DEVICE_TYPE~',SRC.devicetype)
 WHERE COALESCE(TRGT.device_type_key, '')<> coalesce(lov.row_key,'')