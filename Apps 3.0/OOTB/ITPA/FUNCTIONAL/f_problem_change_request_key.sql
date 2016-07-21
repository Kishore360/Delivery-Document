
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.problem_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_change_request LKP 
 ON SRC.rfc = LKP.row_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.rfc IS NULL THEN 0 ELSE -1 END )<> TRGT.change_request_key
