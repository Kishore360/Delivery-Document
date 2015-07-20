
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.asset_substatus_code' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.alm_asset SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(SRC.substatus using utf8),'')<> COALESCE(CONVERT(TRGT.asset_substatus_code using utf8),'')
