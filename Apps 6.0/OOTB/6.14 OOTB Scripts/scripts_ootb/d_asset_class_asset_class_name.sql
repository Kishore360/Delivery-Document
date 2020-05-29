
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset_class.asset_class_name' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_db_object_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset_class TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE 
 (SRC.label='Asset' OR
   SRC.super_class = (SELECT sys_id FROM #MDS_TABLE_SCHEMA.sys_db_object_final WHERE CDCTYPE<>'D'and  name='alm_asset')) and
 COALESCE( SRC.name ,'')<> COALESCE(TRGT.asset_class_name ,'')
