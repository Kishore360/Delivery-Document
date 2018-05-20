
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_user_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.fm_expense_line_final SRC
JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI on (FI.id=SRC.sys_id and FI.field='amount')
JOIN <<tenant>>_mdsdb.pm_project_final SRC_P ON (SRC_P.sys_id = SRC.task) 
 LEFT JOIN <<tenant>>_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( CONVERT(CONCAT('INTERNAL_CONTACT~',SRC.user) using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE SRC.asset Is Null 
AND COALESCE(LKP.row_key,CASE WHEN SRC.user IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_user_key,'')
 

