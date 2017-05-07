SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem_task.domain_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM usf_mdsdb.problem_task_final SRC 
 LEFT JOIN usf_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN usf_mdwdb.d_problem_task LKP 
 ON ( COALESCE(SRC.sys_domain,'UNSPECIFIED')= LKP.row_id )
-- AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else -1 end)<> (TRGT.domain_key)) temp;
 
