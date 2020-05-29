SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_expense_item' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC
RIGHT JOIN #DWH_TABLE_SCHEMA.d_expense_item DWH
ON(DWH.row_id=SRC.sys_id
AND DWH.source_id=SRC.sourceinstance)

WHERE CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END <> COALESCE(DWH.soft_deleted_flag ,'')