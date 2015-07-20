
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.changed_on' ELSE 'SUCCESS' END as Message
  FROM #MDS_TABLE_SCHEMA.alm_asset SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.sourceinstance using utf8)  = convert(L.sourceid using utf8))
 WHERE CONVERT(convert_tz(SRC.sys_updated_on,source_time_zone,target_time_zone) using utf8)<> CONVERT(TRGT.changed_on using utf8)
