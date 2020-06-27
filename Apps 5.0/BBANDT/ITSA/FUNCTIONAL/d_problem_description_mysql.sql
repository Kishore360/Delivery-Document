SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.description' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
 FROM bbandt_mdwdb.problem_final SRC 
 LEFT JOIN bbandt_mdwdb.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.description,'')<> (TRGT.description)) temp;
 
