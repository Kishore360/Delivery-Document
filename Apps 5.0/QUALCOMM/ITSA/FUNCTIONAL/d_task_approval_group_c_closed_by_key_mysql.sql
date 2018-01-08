SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task_approval_group_c.closed_by_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_group_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_task_approval_group_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN qualcomm_mdwdb.d_internal_contact LKP 
 on CONCAT('INTERNAL_CONTACT~',SRC.closed_by)=LKP.row_id 
				and SRC.sourceinstance=LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end) <> TRGT.closed_by_key;

