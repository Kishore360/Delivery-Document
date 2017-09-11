
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_purchase_on_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC
 LEFT JOIN whirlpool_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT 
LEFT JOIN whirlpool_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.purchase_date,'GMT','America/New_York'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.purchase_date IS NULL THEN NULL else '-1' end)  <> COALESCE(TRGT.asset_purchase_on_key,'') 
