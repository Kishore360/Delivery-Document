
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.created_on' ELSE 'SUCCESS' END as Message
  FROM wow_mdsdb.alm_asset_final  SRC 
 LEFT JOIN wow_mdwdb.d_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON ((SRC.sourceinstance )  = (L.sourceid ))
 WHERE (_tz(SRC.sys_created_on,source_time_zone,target_time_zone) )<> TRGT.created_on )
