
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.delivered_on' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.cmdb_ci_appl_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_application TRGT 
 ON (concat('APPLICATION~', SRC.sys_id)  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance   = L.sourceid )
 WHERE convert_tz(SRC.delivery_date,source_time_zone,target_time_zone) <> TRGT.delivered_on 
