
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_depriciated_doc_amount' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.fx_currency_instance SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.amount using utf8),'')<> COALESCE(CONVERT(TRGT.cost_loc_amount using utf8),'')