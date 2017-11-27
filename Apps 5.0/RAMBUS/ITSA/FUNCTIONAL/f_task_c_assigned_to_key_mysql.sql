SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_fss_c.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM rambus_mdsdb.task_final SRC 
  JOIN rambus_mdwdb.f_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 JOIN rambus_mdwdb.d_internal_contact LKP  ON ( coalesce(concat('INTERNAL_CONTACT~',assigned_to),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance= LKP.source_id ) 
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to
 WHERE  TRGT.soft_deleted_flag='N' 
and COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end) <>(TRGT.assigned_to_key);

