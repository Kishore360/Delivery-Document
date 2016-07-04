

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_change.opened_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.hr_change_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_hr_change TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance   = L.sourceid )
 WHERE convert_tz(SRC.opened_at,source_time_zone,target_time_zone) <> TRGT.opened_on 
