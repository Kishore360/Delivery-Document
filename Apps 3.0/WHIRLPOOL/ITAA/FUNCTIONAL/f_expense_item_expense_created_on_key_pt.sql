
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_created_on_key' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.fm_expense_line_final SRC
join whirlpool_mdsdb.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
join whirlpool_mdsdb.pm_project_task_final SRC_PT ON (SRC_PT.sys_id = SRC.task) 
 LEFT join whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT join whirlpool_mdwdb.d_calendar_date LKP 
 ON(date_format(convert_tz(SRC.sys_created_on,'GMT','America/New_York'),'%Y%m%d') =LKP.row_id
AND 0 =LKP.source_id)
 WHERE SRC.asset Is Null 
AND COALESCE(LKP.row_key,CASE WHEN SRC.sys_created_on IS NULL THEN NULL else '-1' end) <> COALESCE(TRGT.expense_created_on_key,'')