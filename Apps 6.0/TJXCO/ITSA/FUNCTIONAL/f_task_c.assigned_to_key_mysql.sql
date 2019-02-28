SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_c.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from tjxco_mdsdb.task_sla_final SRC1 join  tjxco_mdsdb.task_final SRC on SRC1.task=SRC.sys_id and SRC1.sourceinstance=SRC.sourceinstance
  JOIN tjxco_mdwdb.f_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 left JOIN tjxco_mdwdb.d_internal_contact LKP  ON ( coalesce(concat('INTERNAL_CONTACT~',SRC.assigned_to),'UNSPECIFIED')= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end) <> (TRGT.assigned_to_key)) temp;
