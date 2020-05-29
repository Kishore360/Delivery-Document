SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_class' ELSE 'SUCCESS' END as Message
 FROM (SELECT SRC1.* 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC1
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC_P ON SRC_P.sys_id = SRC1.task
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI on FI.id=SRC1.sys_id and FI.field='amount'
WHERE SRC1.task is not null AND SRC1.asset is null
UNION
SELECT SRC1.*
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC1
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC_PT ON SRC_PT.sys_id = SRC1.task
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI on FI.id=SRC1.sys_id and FI.field='amount'
WHERE SRC1.task is not null AND SRC1.asset is null
) SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE 'PROJECT/TASK'<> COALESCE(TRGT.expense_class ,'');