SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_substatus_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.alm_asset SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON ( SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON CONVERT(COALESCE(CONCAT('ASSET~SUBSTATUS~~',SRC.substatus),'UNSPECIFIED') using utf8) =convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8)
AND LKP.dimension_class ='ASSET'
AND LKP.dimension_type = 'SUBSTATUS'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.substatus IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_substatus_key,'')
