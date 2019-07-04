SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.sys_user_grmember_final  SRC 
JOIN meritsa_mdwdb.f_assigned_to_group_member_c TRGT 
ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE SRC.SYS_UPDATED_BY<>(TRGT.Changed_by) 
