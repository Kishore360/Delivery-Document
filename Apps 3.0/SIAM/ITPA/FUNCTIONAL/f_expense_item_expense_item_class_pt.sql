SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_class' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.fm_expense_line_final SRC
JOIN <<tenant>>_mdsdb.pm_project_task_final SRC_PT 
ON (SRC_PT.sys_id = SRC.task) 
JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI on FI.id=SRC_PT.sys_id and FI.field='amount'
LEFT JOIN <<tenant>>_mdwdb.f_expense_item TRGT 
ON (SRC.sys_id=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id )
WHERE SRC.asset Is Null AND SRC.task is not null 
AND 'PROJECT/TASK'<> COALESCE(TRGT.expense_class ,'');
