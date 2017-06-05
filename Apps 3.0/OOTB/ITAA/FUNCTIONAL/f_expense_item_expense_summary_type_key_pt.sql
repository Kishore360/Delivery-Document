
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_summary_type_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.fm_expense_line_final SRC
JOIN #MDS_TABLE_SCHEMA.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN #MDS_TABLE_SCHEMA.pm_project_task_final SRC_PT ON (SRC_PT.sys_id = SRC.task) 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON  ( CONVERT( UCASE( COALESCE(CONCAT('EXPENSE_ITEM~SUMMARY_TYPE~~',SRC.summary_type),'UNSPECIFIED') ) using utf8))= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8)
AND LKP.dimension_class ='EXPENSE_ITEM'
AND LKP.dimension_type = 'SUMMARY_TYPE' WHERE SRC.asset Is Null 
AND COALESCE(LKP.row_key,CASE WHEN SRC.summary_type IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_summary_type_key,'')
