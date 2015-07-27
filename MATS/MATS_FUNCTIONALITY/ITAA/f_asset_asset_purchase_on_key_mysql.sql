
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_purchase_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset SRC
 LEFT JOIN <<tenant>>_mdwdb.f_asset TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.purchase_date,source_time_zone,target_time_zone),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.purchase_date IS NULL THEN NULL else '-1' end) <> COALESCE(TRGT.asset_purchase_on_key,'') 
