SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM ge_mdsdb.problem_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.d_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE CASE WHEN SRC.problem_state in (1,2,3) THEN 'Y' ELSE 'N' END <> TRGT.backlog_flag 

