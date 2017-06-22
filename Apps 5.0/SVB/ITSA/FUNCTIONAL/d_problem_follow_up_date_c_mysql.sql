SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_problem.follow_up_date_c' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdsdb.problem_final SRC
 JOIN svb_mdwdb.d_problem TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE convert_tz(SRC.u_follow_up_date,'GMT','America/Los_Angeles')<> TRGT.follow_up_date_c )b
