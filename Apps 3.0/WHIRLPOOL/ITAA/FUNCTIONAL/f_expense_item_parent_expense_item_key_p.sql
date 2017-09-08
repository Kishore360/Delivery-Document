

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.parent_expense_item_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fm_expense_line_final SRC
 JOIN whirlpool_mdsdb.pm_project_final SRC_P ON (SRC_P.sys_id = SRC.task) 
 LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_expense_item LKP 
 ON ( CONVERT(SRC.parent using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE SRC.asset Is Null 
AND COALESCE(LKP.row_key,CASE WHEN SRC.parent IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.parent_expense_item_key,'')
