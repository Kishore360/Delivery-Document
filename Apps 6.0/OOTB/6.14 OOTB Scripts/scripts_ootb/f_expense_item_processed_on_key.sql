SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.processed_on_key' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
 ON(date_format(convert_tz(SRC.process_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') =LKP.row_id
AND 0 =LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.process_date IS NULL THEN NULL else '' end) <> COALESCE(TRGT.processed_on_key,'')
 AND SRC.asset is not null;
 
