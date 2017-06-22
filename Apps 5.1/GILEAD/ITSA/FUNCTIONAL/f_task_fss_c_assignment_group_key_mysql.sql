
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_fss_c.assignment_group_key' ELSE 'SUCCESS' END as Message
FROM gilead_mdsdb.u_task_fss_final SRC 
 LEFT JOIN gilead_mdwdb.f_task_fss_c TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gilead_mdwdb.d_internal_organization LKP  ON ( coalesce(concat('GROUP~',assignment_group),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance= LKP.source_id )  WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key);