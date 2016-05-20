
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.warranty_expiry_on_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset SRC
 LEFT JOIN wow_mdwdb.f_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON ((SRC.sourceinstance )  = (L.sourceid ))
LEFT JOIN wow_mdwdb.d_calendar_date LKP 
on ((LKP.row_id ) = (date_format(_tz(SRC.warranty_expiration,source_time_zone,target_time_zone),'%Y%m%d') ) and LKP.source_id=0
)
WHERE (COALESCE(LKP.row_key,CASE WHEN SRC.warranty_expiration IS NULL THEN NULL else '-1' end) ) <> (COALESCE(TRGT.warranty_expiry_on_key,'') )
