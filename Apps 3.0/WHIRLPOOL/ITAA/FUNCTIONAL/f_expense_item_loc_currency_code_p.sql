

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.loc_currency_code' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.fm_expense_line_final SRC
JOIN whirlpool_mdsdb.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN whirlpool_mdsdb.pm_project_final SRC_P ON (SRC_P.sys_id = SRC.task) 
 LEFT JOIN whirlpool_mdwdb.fx_currency_instance_final FX1
ON(FX1.id=SRC.sys_id and FX1.field='amount') 
 LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE SRC.asset Is Null 
AND COALESCE( FX1.currency ,'')<> COALESCE(TRGT.loc_currency_code ,'')
