 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_user_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC.user) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.user IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_user_key,'')and SRC.asset is not null;
 

