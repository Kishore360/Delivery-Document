SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.cost_loc_amount' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.fx_currency_instance_final  SRC 
 JOIN wow_mdwdb.f_asset TRGT 
 ON SRC.id = TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
 AND SRC.field='cost'  
 WHERE COALESCE( SRC.amount ,'')<> COALESCE(ROUND(TRGT.cost_loc_amount,2) ,'');