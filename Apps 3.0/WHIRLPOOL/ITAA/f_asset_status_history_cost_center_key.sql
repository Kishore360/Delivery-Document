
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.cost_center_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_asset_status_history TRGT 
on (convert(CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') ) using utf8) =convert(TRGT.row_id using utf8)
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_cost_center LKP 
 ON ( CONVERT(SRC.cost_center using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cost_center IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.cost_center_key,'')
