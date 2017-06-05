SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.processed_on_key' ELSE 'SUCCESS' END as Message
  FROM #MDS_TABLE_SCHEMA.fm_expense_line_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance=L.sourceid )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
 ON(date_format(convert_tz(SRC.process_date,source_time_zone,target_time_zone),'%Y%m%d') =LKP.row_id
AND 0 =LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.process_date IS NULL THEN NULL else '-1' end) <> COALESCE(TRGT.processed_on_key,'')
 AND SRC.asset is not null;
 