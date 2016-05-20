
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.cost_loc_amount' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.fx_currency_instance_final  SRC 
 LEFT JOIN wow_mdwdb.f_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.amount ,'')<> COALESCE(TRGT.cost_loc_amount ,'')
