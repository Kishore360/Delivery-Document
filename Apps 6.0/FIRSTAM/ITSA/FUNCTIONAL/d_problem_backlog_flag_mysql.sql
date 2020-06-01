SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM firstam_mdsdb.problem_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN firstam_mdwdb.d_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE CASE WHEN SRC.state in (-5,1,2,20,21,25,26,27,28,29,3,30) THEN 'Y' ELSE 'N' END <> TRGT.backlog_flag 

