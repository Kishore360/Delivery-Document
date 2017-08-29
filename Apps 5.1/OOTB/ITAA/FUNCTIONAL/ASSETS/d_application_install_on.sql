
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.install_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.cmdb_ci_appl_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_application TRGT 
 ON (convert(concat('APPLICATION~', SRC.sys_id) using utf8) =convert(TRGT.row_id using utf8) 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.sourceinstance using utf8)  = convert(L.sourceid using utf8))
 WHERE CONVERT(convert_tz(SRC.install_date,source_time_zone,target_time_zone) using utf8)<> CONVERT(TRGT.install_on using utf8)
