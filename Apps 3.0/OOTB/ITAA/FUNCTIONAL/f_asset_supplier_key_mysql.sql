
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.supplier_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_supplier LKP 
 ON  COALESCE(CONCAT('SUPPLIER~',SRC.vendor),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
where COALESCE(LKP.row_key,CASE WHEN SRC.vendor IS NULL THEN 0 else '-1' end) <> TRGT.supplier_key;
