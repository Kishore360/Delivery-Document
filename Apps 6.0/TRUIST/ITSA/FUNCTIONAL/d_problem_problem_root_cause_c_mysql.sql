
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.problem_root_cause_c' ELSE 'SUCCESS' END as Message
 FROM (select * from truist_mdsdb.problem_final where cdctype<>'D') SRC 
  JOIN truist_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.u_problem_root_cause<> TRGT.problem_root_cause_c
 
 