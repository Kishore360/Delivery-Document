SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.asset_class_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset_status_history TRGT 
 on (CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') )  =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_db_object_final WHERE CDCTYPE<>'D') sys
 on sys.name=SRC.sys_class_name
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset_class LKP 
 ON ( sys.sys_id = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_class_name IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_class_key,'')

