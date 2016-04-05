

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.known_error_flag' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.problem_final SRC 
 LEFT JOIN molinahealth02_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN known_error= 1 then 'Y' else 'N' END)<> (TRGT.known_error_flag )
