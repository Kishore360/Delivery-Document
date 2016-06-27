
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_item_category_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.fm_expense_line SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('EXPENSE_ITEM~','CATEGORY~','~',category) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_item_category_key ,'')
