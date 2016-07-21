
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_retirement_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset SRC
 LEFT JOIN <<tenant>>_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.retired,'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.retired IS NULL THEN NULL else '-1' end)  <> COALESCE(TRGT.asset_retirement_on_key,'') 