SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.root_cause_sub_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM pandg_mdsdb.problem_final SRC 
LEFT JOIN pandg_mdwdb.d_problem TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN pandg_mdwdb.d_lov LKP ON (CONCAT('ROOT_CAUSE_SUB_CODE_C','~','PROBLEM','~~~',SRC.u_pg_root_cause_sub_code)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_root_cause_sub_code IS NULL THEN 0 ELSE -1 END)<>TRGT.root_cause_sub_code_src_c_key
) temp; 





