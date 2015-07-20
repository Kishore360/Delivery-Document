
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.base_expense_item_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN usf_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN usf_mdwdb.d_expense_item LKP 
 ON ( SRC.base_expense= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.base_expense IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.base_expense_item_key,'')and SRC.asset is not null;
