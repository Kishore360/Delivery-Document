
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_class' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC_P
ON (SRC_P.sys_id = SRC.task) 
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI on FI.id=SRC_P.sys_id and FI.field='amount'
LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
ON (SRC.sys_id=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id )
WHERE SRC.asset Is Null AND SRC.task is not null 
AND 'PROJECT/TASK'<> COALESCE(TRGT.expense_class ,'');
