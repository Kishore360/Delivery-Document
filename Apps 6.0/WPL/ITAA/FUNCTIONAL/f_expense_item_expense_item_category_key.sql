
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_item_category_key' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN wpl_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN wpl_mdwdb.d_lov LKP 
 ON ( concat('EXPENSE_ITEM~','CATEGORY~',category) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else '-1' end)<>TRGT.expense_item_category_key   and SRC.CDCTYPE='X'
