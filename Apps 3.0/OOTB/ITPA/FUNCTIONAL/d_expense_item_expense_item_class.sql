SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.expense_item_class' ELSE 'SUCCESS' END as Message
 FROM (SELECT SRC1.1 
FROM <<tenant>>_mdsdb.fm_expense_line_final SRC1
JOIN <<tenant>>_mdsdb.pm_project_final SRC_P ON SRC_P.sys_id = SRC1.task
JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI on FI.id=SRC1.sys_id and FI.field='amount'
WHERE SRC1.task is not null AND SRC1.asset is null
UNION
SELECT SRC1.1
FROM <<tenant>>_mdsdb.fm_expense_line_final SRC1
JOIN <<tenant>>_mdsdb.pm_project_task_final SRC_PT ON SRC_PT.sys_id = SRC1.task
JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI on FI.id=SRC1.sys_id and FI.field='amount'
WHERE SRC1.task is not null AND SRC1.asset is null
) SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE 'PROJECT/TASK'<> COALESCE(TRGT.expense_class ,'');
