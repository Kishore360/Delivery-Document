


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for problem_task_final.closure_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM nbcu_mdsdb.task_final SRC 
JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
LEFT JOIN nbcu_mdsdb.problem_task_final PT ON (SRC.sys_id=PT.sys_id AND SRC.sourceinstance=PT.sourceinstance AND SRC.sys_class_name='PROBLEM_TASK')
JOIN nbcu_mdwdb.d_lov LKP ON COALESCE( CONCAT('U_CLOSURE_CODE~PROBLEM_TASK','~','~','~',UPPER(PT.u_closure_code)),'UNSPECIFIED')=LKP.row_id AND PT.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN PT.u_closure_code IS NULL THEN 0 ELSE -1 END)<>TRGT.closure_code_src_c_key
) temp;

 

