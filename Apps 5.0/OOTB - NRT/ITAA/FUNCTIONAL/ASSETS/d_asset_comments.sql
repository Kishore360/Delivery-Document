
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.comments' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.comments using utf8),'')<> COALESCE(CONVERT(TRGT.comments using utf8),'')
