SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_asset.depreciated_doc_amount' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt from
whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_asset TRGT 
 ON ( SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
  WHERE SRC.resale_price * ROUND(( cost_loc_amount / cost_doc_amount), 2) <> TRGT.resale_price_loc_amount
  and SRC.cdctype='X')t ;
