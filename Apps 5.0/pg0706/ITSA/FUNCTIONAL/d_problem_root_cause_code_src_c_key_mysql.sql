SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.root_cause_code_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.problem_final SRC 
LEFT JOIN  png_mdwdb.d_problem TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
JOIN png_mdwdb.d_lov LKP 
ON ( concat('ROOT_CAUSE_CODE_C','~','PROBLEM','~',SRC.u_pg_root_cause_code)= LKP.src_rowid AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_root_cause_code IS NULL THEN 0 else -1 end) <> (TRGT.root_cause_code_src_c_key)
AND TRGT.soft_deleted_flag='N'
) temp;

 
 
 