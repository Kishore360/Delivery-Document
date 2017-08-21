
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.row_id' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN wow_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CONVERT(SRC.sys_id using utf8),'')<> COALESCE(CONVERT(TRGT.row_id using utf8),'')and SRC.asset is not null;
