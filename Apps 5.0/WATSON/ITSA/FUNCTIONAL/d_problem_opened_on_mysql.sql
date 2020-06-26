SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.opened_on' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT
 FROM watson_mdsdb.problem_final SRC  LEFT JOIN watson_mdwdb.d_problem TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE convert_tz(SRC.opened_at,'GMT','UTC')<> TRGT.opened_on)temp; 


