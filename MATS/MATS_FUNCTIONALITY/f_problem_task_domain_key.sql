

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.domain_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.problem_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_domain LKP 
 ON ( SRC.sys_domain= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_domain IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.domain_key,'')
