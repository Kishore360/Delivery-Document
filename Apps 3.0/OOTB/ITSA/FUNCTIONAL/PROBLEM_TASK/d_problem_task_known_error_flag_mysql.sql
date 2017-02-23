

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem_task.known_error_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
FROM <<tenant>>_mdsdb.problem_task_final SRC 
LEFT JOIN <<tenant>>_mdsdb.problem_final PRB 
ON (SRC.problem =PRB.sys_id  
AND SRC.sourceinstance= PRB.sourceinstance  )
LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( 
 -- CASE WHEN PRB.known_error= 1 then 'Y' else 
 'N' 
 -- END 
,'')<> COALESCE(TRGT.known_error_flag ,'')) temp;

