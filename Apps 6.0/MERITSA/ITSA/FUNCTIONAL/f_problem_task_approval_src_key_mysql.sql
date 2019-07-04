SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem_task.approval_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM meritsa_mdsdb.problem_task_final SRC 
LEFT JOIN meritsa_mdwdb.f_problem_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN meritsa_mdwdb.d_lov LKP ON (COALESCE( CONCAT('APPROVAL','~','PROBLEM_TASK','~','~','~',UPPER(SRC.approval)),'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 ELSE -1 END)<>TRGT.approval_src_key
) temp;



