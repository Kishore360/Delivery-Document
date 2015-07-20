
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.created_on' ELSE 'SUCCESS' END as Message
  FROM usf_mdsdb.alm_asset SRC 
 LEFT JOIN usf_mdwdb.f_asset_status_history TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid )
 WHERE convert_tz(SRC.sys_created_on,source_time_zone,target_time_zone)<> TRGT.created_on 
