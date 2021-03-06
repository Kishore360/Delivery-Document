SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_status_key' ELSE 'SUCCESS' END as Message
FROM 
<<tenant>>_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON (  UCASE(CONCAT('EXPENSE_ITEM~STATUS~~',SRC.state) ))= LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
AND LKP.dimension_class ='EXPENSE_ITEM'
AND LKP.dimension_type = 'STATUS'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.expense_status_key,'')
and SRC.asset is not null;






