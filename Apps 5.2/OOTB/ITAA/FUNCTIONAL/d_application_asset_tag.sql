
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.asset_tag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.cmdb_ci_appl_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_application TRGT 
 ON (convert(concat('APPLICATION~', SRC.sys_id) using utf8) =convert(TRGT.row_id using utf8) 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.asset_tag using utf8),'')<> COALESCE(CONVERT(TRGT.asset_tag using utf8),'')
