
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.short_desc' ELSE 'SUCCESS' END as Message
 
 FROM mcdonalds_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN  mcdonalds_mdwdb.d_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.short_description using utf8),'')<> COALESCE(CONVERT(TRGT.short_desc using utf8),'');


