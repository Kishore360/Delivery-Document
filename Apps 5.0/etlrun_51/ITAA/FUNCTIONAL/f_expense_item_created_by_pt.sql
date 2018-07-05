

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.created_by' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.fm_expense_line_final SRC
JOIN wow_mdsdb.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN wow_mdsdb.pm_project_task_final SRC_PT ON (SRC_PT.sys_id = SRC.task) 
 LEFT JOIN wow_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE SRC.asset Is Null 
AND COALESCE( CONVERT(SRC.sys_created_by using utf8),'')<> COALESCE(CONVERT(TRGT.created_by using utf8),'')

