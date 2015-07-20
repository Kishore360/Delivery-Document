SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.processed_on_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.fm_expense_line_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
 ON ( CONVERT(SRC.process_date using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.process_date IS NULL THEN NULL else '-1' end)<> COALESCE(TRGT.processed_on_key,'')and SRC.asset is not null;
