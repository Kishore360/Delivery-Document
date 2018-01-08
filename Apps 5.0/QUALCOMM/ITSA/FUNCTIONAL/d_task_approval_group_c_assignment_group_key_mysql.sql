SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task_approval_group_c.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sysapproval_group_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_task_approval_group_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN qualcomm_mdwdb.d_internal_organization LKP 
 ON ( concat('GROUP~',assignment_group)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval_user IS NULL THEN 0 else -1 end) <> TRGT.assignment_group_key;

