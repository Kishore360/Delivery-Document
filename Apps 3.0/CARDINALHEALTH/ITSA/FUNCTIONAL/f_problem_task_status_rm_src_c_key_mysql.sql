SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.problem_task_final SRC 
  JOIN cardinalhealth_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON  COALESCE(CONCAT('STATUS_C~TASK~~~',UPPER(SRC.u_status)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_status IS NULL THEN 0 else -1 end)<>(TRGT.status_rm_src_c_key))temp;
 