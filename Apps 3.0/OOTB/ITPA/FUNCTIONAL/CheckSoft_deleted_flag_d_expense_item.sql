SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_expense_item' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.fm_expense_line_bwd_delta SRC
RIGHT JOIN <<tenant>>_mdwdb.d_expense_item DWH
ON(DWH.row_id=SRC.sys_id
AND DWH.source_id=SRC.sourceinstance
AND SRC.jobid =(select max(jobid) from <<tenant>>_mdsdb.fm_expense_line_bwd_delta WHERE sys_id = SRC.sys_id) 
AND SRC.cdctype <>'I')
WHERE CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(DWH.soft_deleted_flag ,'')
