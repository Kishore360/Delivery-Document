
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.expense_status_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.fm_expense_line_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_expense_item TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(SRC.state using utf8),'')<> COALESCE(CONVERT(TRGT.expense_status_key using utf8),'')and SRC.asset is not null;
