SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN whirlpool_mdwdb.d_cost_center LKP1
on COALESCE( SRC.cost_center,'UNSPECIFIED') =LKP1.row_id
 WHERE COALESCE(LKP1.row_key,CASE WHEN COALESCE(SRC.cost_center) IS NULL THEN 0  else '-1' end)<> TRGT.cost_center_key;