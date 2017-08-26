
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.warranty_expiry_on_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC
 LEFT JOIN whirlpool_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT 
LEFT JOIN whirlpool_mdwdb.d_calendar_date LKP 
on (convert(LKP.row_id using utf8) = convert(date_format(convert_tz(SRC.warranty_expiration,'GMT','America/New_York'),'%Y%m%d') using utf8) and LKP.source_id=0
)
WHERE CONVERT(COALESCE(LKP.row_key,CASE WHEN SRC.warranty_expiration IS NULL THEN NULL else '-1' end) using utf8) <> CONVERT(COALESCE(TRGT.warranty_expiry_on_key,'') using utf8)
