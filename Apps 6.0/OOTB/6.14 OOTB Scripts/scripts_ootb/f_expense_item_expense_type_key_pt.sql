
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_type_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC_PT ON (SRC_PT.sys_id = SRC.task) 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (  UCASE( COALESCE(CONCAT('EXPENSE_ITEM~TYPE~',SRC.type),'UNSPECIFIED') ) )= LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
AND LKP.dimension_class ='EXPENSE_ITEM~TYPE'
 WHERE SRC.asset Is Null 
AND COALESCE(LKP.row_key,CASE WHEN SRC.type IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_type_key,'')
