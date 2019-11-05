SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_loc_amount' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fm_expense_line_final SRC 
 JOIN whirlpool_mdsdb.fx_currency_instance_final SRC2
 ON(SRC2.id=SRC.sys_id and SRC2.field='amount')
 LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CAST(SRC2.amount as decimal(20,10)),'')<> COALESCE(TRGT.expense_loc_amount ,'')
 and SRC.asset is not null;
