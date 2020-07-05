

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.problem_number' ELSE 'SUCCESS' END as Message
 FROM ( SELECT sys_id,sourceinstance FROM ibmwatson_mdsdb.problem_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ibmwatson_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.number ,'')<> COALESCE(TRGT.problem_task_number_c ,'')
