
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.product_model_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_product_model LKP 
 ON ( CONVERT(SRC.model using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.model IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.product_model_key,'')
