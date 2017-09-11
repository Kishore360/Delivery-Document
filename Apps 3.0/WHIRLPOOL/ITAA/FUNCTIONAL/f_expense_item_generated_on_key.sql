SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.generated_on_key' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.fm_expense_line_final SRC
LEFT JOIN whirlpool_mdwdb.f_expense_item TRGT
ON (SRC.sys_id=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN whirlpool_mdwdb.d_calendar_date LKP
ON COALESCE(DATE_FORMAT(convert_tz(SRC.date,'GMT','America/Los_Angeles'),'%Y%m%d')) = LKP.row_id
-- AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.date IS NULL THEN NULL else '-1' end)<> COALESCE(TRGT.generated_on_key,'')and SRC.asset is not null;