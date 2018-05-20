

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.changed_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.fm_expense_line_final SRC
JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN <<tenant>>_mdsdb.pm_project_final SRC_P ON (SRC_P.sys_id = SRC.task) 
 LEFT JOIN <<tenant>>_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON (convert(SRC.sourceinstance using utf8)  = convert(L.sourceid using utf8))
 WHERE SRC.asset Is Null 
AND CONVERT(convert_tz(SRC.sys_updated_on,source_time_zone,target_time_zone) using utf8)<> CONVERT(TRGT.changed_on using utf8)
