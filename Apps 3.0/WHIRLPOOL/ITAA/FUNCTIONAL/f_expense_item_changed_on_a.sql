
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.changed_on' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.fm_expense_line_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE CONVERT(convert_tz(SRC.sys_updated_on,'GMT','America/New_York') using utf8)<> CONVERT(TRGT.changed_on using utf8)and SRC.asset is not null;
