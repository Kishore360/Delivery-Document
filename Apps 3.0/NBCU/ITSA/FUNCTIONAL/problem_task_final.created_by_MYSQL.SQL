SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for problem_task_final.created_by' ELSE 'SUCCESS' END as  Message
FROM 
(
Select Count(1) as CNT 
FROM nbcu_mdsdb.problem_task_final SRC 
JOIN nbcu_mdwdb.d_problem_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE SRC.sys_created_by<>TRGT.created_by
)temp;