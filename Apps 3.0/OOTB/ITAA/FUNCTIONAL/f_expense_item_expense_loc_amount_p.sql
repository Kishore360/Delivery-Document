
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_loc_amount' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.fm_expense_line_final SRC
JOIN #MDS_TABLE_SCHEMA.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN #MDS_TABLE_SCHEMA.pm_project_final SRC_P ON (SRC_P.sys_id = SRC.task) 
 JOIN #MDS_TABLE_SCHEMA.fx_currency_instance_final SRC2
 ON(SRC2.id=SRC.sys_id and SRC2.field='amount')
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE SRC.asset Is Null 
AND COALESCE( CAST(SRC2.amount as decimal(20,10)),'')<> COALESCE(TRGT.expense_loc_amount ,'')
 
