
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.doc_currency_code' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.fm_expense_line SRC 
 LEFT JOIN <<tenant>>_mdsdb.fx_currency_instance_final FX1
ON(FX1.id=SRC.sys_id and FX1.field='amount') 
 LEFT JOIN <<tenant>>_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(FX1.reference_currency using utf8),'')<> COALESCE(CONVERT(TRGT.doc_currency_code using utf8),'')
