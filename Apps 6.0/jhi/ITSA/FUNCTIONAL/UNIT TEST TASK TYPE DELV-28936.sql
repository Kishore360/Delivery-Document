SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task.task_type_src_key' ELSE 'SUCCESS' END as Message
FROM (Select Count(1) as CNT
FROM jhi_mdsdb.task_final SRC
JOIN jhi_mdwdb.d_task TRGT ON (SRC.sys_id = TRGT.row_key and SRC.sourceinstance = TRGT.source_id)
JOIN jhi_mdwdb.d_lov LKP ON COALESCE(upper(SRC.sys_class_name ),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_class_name iS NULL THEN 0 ELSE -1 END) <> TRGT.task_type_src_key AND TRGT.soft_deleted_flag='N' ) temp;