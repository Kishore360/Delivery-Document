SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.linked_incident_flag' ELSE 'SUCCESS' END as Message
 FROM richemont_mdsdb.problem_final SRC 
 LEFT JOIN richemontdev_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE (SRC.u_close_code)<>(TRGT.close_code_c)