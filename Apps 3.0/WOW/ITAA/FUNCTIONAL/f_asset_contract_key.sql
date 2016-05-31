SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.contract_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset TRGT ON (SRC.sys_id = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN wow_mdwdb.d_sales_contract LKP 
 ON ( SRC.lease_id )= (LKP.row_id ) AND SRC.sourceinstance = (LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.lease_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.contract_key,'');