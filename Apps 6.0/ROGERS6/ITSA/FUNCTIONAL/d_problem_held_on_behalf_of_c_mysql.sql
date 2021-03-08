
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.held_on_behalf_of_c' ELSE 'SUCCESS' END as Message FROM rogers6_mdsdb.problem_final  SRC JOIN rogers6_mdwdb.d_problem TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.u_held_on_behalf_of <> (TRGT.held_on_behalf_of_c) and SRC.CDCTYPE='X' 
