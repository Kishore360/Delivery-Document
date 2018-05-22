 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.row_id' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_asset_status_history TRGT 
 ON (convert(CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') ) using utf8) =convert(TRGT.row_id using utf8) 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') ),'')<> COALESCE(TRGT.row_id ,'')
 
