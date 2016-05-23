
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset_class.changed_on' ELSE 'SUCCESS' END as Message
  FROM wow_mdsdb.sys_db_object_final  SRC 
 LEFT JOIN wow_mdwdb.d_asset_class TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON ((SRC.sourceinstance )  = (L.sourceid ))
 WHERE (_tz(SRC.sys_updated_on,source_time_zone,target_time_zone) )<> TRGT.changed_on )