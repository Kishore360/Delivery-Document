SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_status_key' ELSE 'SUCCESS' END as Message
 FROM appsqacds_mdsdb.alm_asset SRC 
 LEFT JOIN appsqacds_mdwdb.f_asset TRGT 
 ON ( CONVERT(SRC.sys_id using utf8)  =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN appsqacds_mdwdb.d_lov LKP 
 ON CONVERT(COALESCE(CONCAT('ASSET~STATUS~~',SRC.install_status) ,'UNSPECIFIED') using utf8) = convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8)
AND LKP.dimension_class ='ASSET'
AND LKP.dimension_type = 'STATUS'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.install_status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.asset_status_key,'')
