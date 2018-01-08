SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task_approval_group_c.group_approval_number' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_group_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_task_approval_group_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.number <> TRGT.group_approval_number;

