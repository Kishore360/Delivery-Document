

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message 
 FROM rei_mdsdb.change_task_final SRC
 LEFT JOIN rei_mdwdb.f_change_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN rei_mdwdb.d_internal_contact LKP 
 ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.closed_by),'UNSPECIFIED')= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key);