
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset_class.asset_class_name' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sys_db_object SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset_class TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(SRC.super_class using utf8),'')<> COALESCE(CONVERT(TRGT.asset_class_name using utf8),'')
