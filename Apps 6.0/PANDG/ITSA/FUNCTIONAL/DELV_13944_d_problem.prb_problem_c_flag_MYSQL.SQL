SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.prb_problem_c_flag' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT
FROM pandg_mdsdb.problem_final SRC 
LEFT JOIN pandg_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE (CASE WHEN TRGT.problem_number LIKE 'PRB%' THEN 'Y' ELSE 'N' END)<>TRGT.prb_problem_c_flag
) temp;



 