SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.u_root_cause_identified' ELSE 'SUCCESS' END as Message FROM rogersdev_mdsdb.problem_final  SRC JOIN rogersdev_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) WHERE convert_tz(SRC.u_root_cause_identified,'GMT','America/New_York')<> (TRGT.u_root_cause_identified) 
