
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.contract_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_mdwdb.d_contract LKP 
 ON ( SRC.contract = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contract IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.contract_key,'')
