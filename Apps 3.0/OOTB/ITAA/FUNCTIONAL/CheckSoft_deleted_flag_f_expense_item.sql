SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for f_expense_item' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.fm_expense_line_bwd_delta SRC
RIGHT JOIN #DWH_TABLE_SCHEMA.f_expense_item DWH
ON(DWH.row_id=SRC.sys_id
AND DWH.source_id=SRC.sourceinstance
AND SRC.jobid =(select max(jobid) from #MDS_TABLE_SCHEMA.fm_expense_line_bwd_delta WHERE sys_id = SRC.sys_id) 
AND SRC.cdctype <>'I')
WHERE CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(DWH.soft_deleted_flag ,'')