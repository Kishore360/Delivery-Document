
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.row_id' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.sys_id using utf8),'')<> COALESCE(CONVERT(TRGT.row_id using utf8),'')
