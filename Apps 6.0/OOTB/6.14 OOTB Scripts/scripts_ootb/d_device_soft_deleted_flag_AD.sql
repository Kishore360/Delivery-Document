 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for D_DEVICE.SOFT_DELETED_FLAG' ELSE 'SUCCESS' END as Message
 FROM
 (select TRGT.row_id from 
  #MDS_TABLE_SCHEMA.web_session_records_raw_final SRC 
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_device TRGT 
 ON CONCAT(COALESCE(SRC.device,''),'~',COALESCE(SRC.deviceos,''))=TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id 
 WHERE COALESCE(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'')<>COALESCE(TRGT.soft_deleted_flag,'')
union
select TRGT.row_id from 
 #MDS_TABLE_SCHEMA.mobile_session_records_raw_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_device TRGT 
 ON CONCAT(COALESCE(SRC.devicename,''),'~',COALESCE(SRC.devicemodel,''),'~',COALESCE(SRC.osversion,''))=TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id 
  WHERE COALESCE(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'')<>COALESCE(TRGT.soft_deleted_flag,'')) SQ
 
 
 