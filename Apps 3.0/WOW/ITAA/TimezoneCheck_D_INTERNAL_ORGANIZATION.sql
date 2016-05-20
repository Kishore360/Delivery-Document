SELECT CASE WHEN count(1) <> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) <>0 THEN 'MDS to DWH data validation failed for d_internal_organization.changed_on' 
 ELSE 'SUCCESS' END as Message
  FROM  app_test.ds_internal_organization SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization TRGT 
 ON (convert(SRC.row_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.source_id using utf8)= convert(TRGT.source_id using utf8) )
JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.source_id using utf8)  = convert(L.sourceid using utf8))
 WHERE CONVERT(convert_tz(SRC.created_on,source_time_zone,target_time_zone) using utf8)<> 
 CONVERT(TRGT.created_on using utf8)
 and CONVERT(convert_tz(SRC.changed_on,source_time_zone,target_time_zone) using utf8)<> 
 CONVERT(TRGT.changed_on using utf8);