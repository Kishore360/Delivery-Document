

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.priority_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM rogers_mdsdb.problem_final SRC 
  JOIN rogers_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN rogers_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY','~','problem','~',upper(priority))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key)
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N')b
