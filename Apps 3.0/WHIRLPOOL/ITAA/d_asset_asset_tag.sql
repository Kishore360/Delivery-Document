
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.asset_tag' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.asset_tag using utf8),'')<> COALESCE(CONVERT(TRGT.asset_tag using utf8),'')
