
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.loc_currency_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.fx_currency_instance_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN wow_mdwdb.d_lov LKP 
 ON ( SRC.currency )= (LKP.row_id )
AND SRC.sourceinstance )= (LKP.source_id ))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.currency IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.loc_currency_key,'')