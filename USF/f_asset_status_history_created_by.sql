
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.created_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.alm_asset SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset_status_history TRGT 
on (convert(CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') ) using utf8) =convert(TRGT.row_id using utf8)
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(SRC.sys_created_by using utf8),'')<> COALESCE(CONVERT(TRGT.created_by using utf8),'')
