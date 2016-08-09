SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.caused_by_changed_c_flag' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.problem_final SRC 
 LEFT JOIN homedepot_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN SRC.u_caused_by_change_id is not null then 'Y' else 'N' END)<> (TRGT.caused_by_changed_c_flag )
