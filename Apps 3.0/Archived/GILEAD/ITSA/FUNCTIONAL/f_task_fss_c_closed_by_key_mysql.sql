SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_fss_c.closed_by_key' ELSE 'SUCCESS' END as Message
FROM gilead_mdsdb.u_task_fss_final SRC 
 LEFT JOIN gilead_mdwdb.f_task_fss_c TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN gilead_mdwdb.d_internal_contact LKP  ON ( coalesce(concat('INTERNAL_CONTACT~',closed_by),'UNSPECIFIED')= LKP.row_id AND SRC.sourceinstance= LKP.source_id )  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key);


