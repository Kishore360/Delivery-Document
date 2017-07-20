SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.purchase_date' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_.alm_asset_final SRC 
 LEFT JOIN <<tenant>>_.d_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(convert_tz(SRC.purchase_date,'GMT','America/Los_Angeles') using utf8),'')<> COALESCE(CONVERT(TRGT.purchase_date using utf8),'')