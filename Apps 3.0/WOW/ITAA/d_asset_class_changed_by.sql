
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset_class.changed_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sys_db_object SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset_class TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.sys_updated_by using utf8),'')<> COALESCE(CONVERT(TRGT.changed_by using utf8),'')
