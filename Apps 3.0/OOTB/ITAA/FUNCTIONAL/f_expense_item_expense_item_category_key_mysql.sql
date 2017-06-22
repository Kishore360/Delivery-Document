SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.asset_owned_by_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  JOIN whirlpool_mdsdb.alm_asset_final LKP 
 ON  LKP.sys_id = SRC.asset 
AND LKP.sourceinstance = LKP.sourceinstance
 LEFT JOIN whirlpool_mdwdb.d_lov LKP1 
 ON  COALESCE(CONCAT('EXPENSE_ITEM~U_EXPENSE_CATEGORY~~',SRC.u_expense_category),'UNSPECIFIED') = LKP1.row_id 
AND SRC.sourceinstance = LKP1.source_id  
where COALESCE(LKP1.row_key,CASE WHEN SRC.u_expense_category IS NULL THEN 0 else '-1' end) <> TRGT.expense_item_category_key;