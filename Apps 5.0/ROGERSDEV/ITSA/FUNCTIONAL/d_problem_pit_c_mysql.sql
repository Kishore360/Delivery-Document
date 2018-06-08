SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_problem.u_rca_summary_c' ELSE 'SUCCESS' END as Message FROM rogersdev_mdsdb.problem_final 
 SRC JOIN rogersdev_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE coalesce(SRC.u_pit,'UNSPECIFIED') <> (TRGT.pit_c) 
