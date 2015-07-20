SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_category_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.fm_expense_line_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONVERT( UCASE( COALESCE(CONCAT('EXPENSE_ITEM~CATEGORY~~' ,SRC.category))) using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
AND LKP.dimension_class ='EXPENSE_ITEM'
AND LKP.dimension_type = 'CATEGORY'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_item_category_key,'')


and SRC.asset is not null;
