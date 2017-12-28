
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.expense_type' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.fm_expense_line SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.type using utf8),'')<> COALESCE(CONVERT(TRGT.expense_type using utf8),'')
