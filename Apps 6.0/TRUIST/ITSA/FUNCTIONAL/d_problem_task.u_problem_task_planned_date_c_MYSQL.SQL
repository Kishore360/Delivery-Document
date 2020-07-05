SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DWH Data Validation Failed for d_problem_task.u_problem_task_planned_date_c' ELSE 'SUCCESS' END AS MESSAGE 
FROM (SELECT Count(1) as CNT 
FROM truist_mdsdb.problem_task_final SRC 
JOIN truist_mdwdb.d_problem_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CONVERT_TZ (SRC.u_problem_task_planned_date,'GMT','America/Los_Angeles')<>TRGT.u_problem_task_planned_date_c
)temp; 



