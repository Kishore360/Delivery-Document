SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.department_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.alm_asset_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset_status_history TRGT 
 ON (convert(concat(SRC.sys_id,'~',date_format(sys_created_on,'%Y%m%d%H%i%S' ) ) using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization LKP 
 ON  ( CONVERT(CONCAT('DEPARTMENT~',SRC.department) using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.department IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.department_key,'')
