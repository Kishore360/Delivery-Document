SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for D_DEVICE.DEVICE_MODEL' ELSE 'SUCCESS' END as Message
 FROM
 (select TRGT.row_id from 
 #MDS_TABLE_SCHEMA.mobile_session_records_raw_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.D_DEVICE TRGT 
ON CONCAT('DEVICE~',SRC.deviceName,'~',SRC.carrier)=TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id 
 WHERE COALESCE(SRC.devicemodel, '')<> COALESCE(TRGT.DEVICE_MODEL,'')) SQ