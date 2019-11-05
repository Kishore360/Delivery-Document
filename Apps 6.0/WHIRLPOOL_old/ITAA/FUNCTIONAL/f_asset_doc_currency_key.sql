
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.doc_currency_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fx_currency_instance SRC 
 LEFT JOIN whirlpool_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON ( SRC.reference_currency = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.reference_currency IS NULL THEN NULL else '-1' end)<> COALESCE(TRGT.doc_currency_key,'')
