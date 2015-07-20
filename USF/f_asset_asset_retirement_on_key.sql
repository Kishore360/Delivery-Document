
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_retirement_on_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.alm_asset SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.sourceinstance using utf8)  = convert(L.sourceid using utf8))
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on (convert(LKP.row_id using utf8) = convert(date_format(convert_tz(SRC.retired,source_time_zone,target_time_zone),'%Y%m%d') using utf8) and LKP.source_id=0
)
WHERE CONVERT(COALESCE(LKP.row_key,CASE WHEN SRC.retired IS NULL THEN NULL else '-1' end) using utf8) <> CONVERT(COALESCE(TRGT.asset_retirement_on_key,'') using utf8)
