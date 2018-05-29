SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_c.outage_duration_c' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.problem_final SRC
  JOIN pan6_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TRGT.outage_duration_c = TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.u_duration_of_outage)