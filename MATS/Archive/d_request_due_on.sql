

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.due_on' ELSE 'SUCCESS' END as Message
  FROM #MDS_TABLE_SCHEMA.sc_request_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.sourceinstance using utf8)  = convert(L.sourceid using utf8))
 WHERE CONVERT(convert_tz(SRC.due_date,source_time_zone,target_time_zone) using utf8)<> CONVERT(TRGT.due_on using utf8)
