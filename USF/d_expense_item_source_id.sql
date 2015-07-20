
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.source_id' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN usf_mdwdb.d_expense_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,'')<> COALESCE(TRGT.source_id ,'')and SRC.asset is not null;
