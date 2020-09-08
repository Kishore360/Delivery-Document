SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.priority_src_code_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM ntrs_mdsdb.u_problem_task_final SRC 
LEFT JOIN ntrs_mdwdb.d_problem_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(SRC.u_priority,'UNSPECIFIED')<>TRGT.priority_src_code_c
AND SRC.cdctype='X' ) temp; 