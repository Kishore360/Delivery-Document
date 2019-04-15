
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_c.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from tjxco_mdsdb.task_sla_final SRC1 
left join  tjxco_mdsdb.task_final SRC on SRC1.task=SRC.sys_id and SRC1.sourceinstance=SRC.sourceinstance
 left join  tjxco_mdwdb.f_task TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN tjxco_mdwdb.d_internal_organization LKP  
ON ( coalesce(concat('GROUP~',assignment_group),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end) <> (TRGT.assignment_group_key)) temp;