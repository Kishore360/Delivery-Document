
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_sys_created_on_on_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset SRC
 LEFT JOIN usf_mdwdb.f_asset TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
LEFT JOIN usf_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.sys_created_on,source_time_zone,target_time_zone),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_created_on IS NULL THEN 0 else '-1' end) <> COALESCE(TRGT.asset_created_on_key,'') 
