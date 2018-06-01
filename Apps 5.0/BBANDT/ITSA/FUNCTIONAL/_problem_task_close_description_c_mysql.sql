SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DWH Data Validation Failed for d_problem_task.close_description_c' ELSE 'SUCCESS' END AS MESSAGE 
FROM (SELECT Count(1) as CNT 
FROM bbandt_mdsdb.problem_task_final SRC 
JOIN bbandt_mdwdb.d_problem_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE SRC.u_close_description<>TRGT.close_description_c
)temp; 



