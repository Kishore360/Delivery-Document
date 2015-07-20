
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.doc_currency_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.fx_currency_instance SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONVERT(SRC.reference_currency using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.reference_currency IS NULL THEN NULL else '-1' end)<> COALESCE(TRGT.doc_currency_key,'')
