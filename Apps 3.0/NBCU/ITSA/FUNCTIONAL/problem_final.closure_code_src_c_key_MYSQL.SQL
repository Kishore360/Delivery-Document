


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for problem_final.closure_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM nbcu_mdsdb.task_final SRC 
JOIN nbcu_mdwdb.f_task_c TRGT ON (SRC.sys_id =TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
LEFT JOIN nbcu_mdsdb.problem_final PR ON (SRC.sys_id=PR.sys_id AND SRC.sourceinstance=PR.sourceinstance AND SRC.sys_class_name='PROBLEM')
JOIN nbcu_mdwdb.d_lov LKP ON COALESCE( CONCAT('STATE','~','PROBLEM','~','~','~',UPPER(SRC.state)),'UNSPECIFIED')=LKP.row_id AND PR.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.state IS NULL THEN 0 ELSE -1 END)<>TRGT.closure_code_src_c_key
) temp;

 

