SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.cost_doc_amount' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset TRGT 
 ON SRC.sys_id = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id 
 WHERE COALESCE( SRC.cost ,'')<> COALESCE(ROUND(TRGT.cost_doc_amount,2) ,'');