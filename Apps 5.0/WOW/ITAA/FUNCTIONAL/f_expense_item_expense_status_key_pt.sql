SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_status_key' ELSE 'SUCCESS' END as Message
FROM wow_mdsdb.fm_expense_line_final SRC 
JOIN wow_mdsdb.pm_project_task_final SRC_PT ON (SRC_PT.sys_id = SRC.task) 
 JOIN wow_mdsdb.fx_currency_instance_final FI on FI.id=SRC_PT.sys_id and FI.field='amount'
LEFT JOIN wow_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN wow_mdwdb.d_lov LKP 
 ON ( CONVERT (UCASE(CONCAT('EXPENSE_ITEM~STATUS~~',SRC.state) )using utf8))= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8)
AND LKP.dimension_class ='EXPENSE_ITEM'
AND LKP.dimension_type = 'STATUS'
 WHERE SRC.asset Is Null And SRC.base_expense Is Null
AND COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_status_key,'')
