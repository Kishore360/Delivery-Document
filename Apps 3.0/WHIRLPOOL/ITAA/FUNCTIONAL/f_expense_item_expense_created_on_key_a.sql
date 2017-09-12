
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_created_on_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fm_expense_line_final SRC 
 LEFT join whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT join whirlpool_mdwdb.d_calendar_date LKP 
 ON ( SRC.sys_created_on = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_created_on IS NULL THEN NULL else '-1' end)<> COALESCE(TRGT.expense_created_on_key,'')and SRC.asset is not null;
