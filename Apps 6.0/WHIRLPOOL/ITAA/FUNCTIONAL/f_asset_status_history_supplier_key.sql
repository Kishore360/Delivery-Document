SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.supplier_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_asset_status_history TRGT 
 on (CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') )  =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN whirlpool_mdwdb.d_supplier LKP 
 ON ( CONCAT('SUPPLIER~',SRC.vendor) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.vendor IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.supplier_key,'')
 and SRC.cdctype='X'
