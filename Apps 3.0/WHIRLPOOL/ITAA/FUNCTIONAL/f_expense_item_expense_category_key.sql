SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_category_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fm_expense_line_final SRC 
 LEFT join whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT join whirlpool_mdwdb.d_lov LKP 
 ON (  UCASE( COALESCE(CONCAT('EXPENSE_ITEM~CATEGORY~~' ,SRC.category))) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
AND LKP.dimension_class ='EXPENSE_ITEM'
AND LKP.dimension_type = 'CATEGORY'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_item_category_key,'')


and SRC.asset is not null;
