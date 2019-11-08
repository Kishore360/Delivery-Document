

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_doc_amount' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fm_expense_line_final SRC
JOIN whirlpool_mdsdb.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN whirlpool_mdsdb.pm_project_task_final SRC_PT ON (SRC_PT.sys_id = SRC.task) 
 LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE SRC.asset Is Null 
AND COALESCE( CAST(SRC.amount as decimal(20,10)),'')<> COALESCE(TRGT.expense_doc_amount, '')
and SRC.cdctype='X'
 
