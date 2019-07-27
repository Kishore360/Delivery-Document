SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.sufficient_impact_to_proceed_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM png_mdsdb.problem_final SRC 
LEFT JOIN png_mdwdb.d_problem TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_lov LKP ON CONCAT('SUFFICIENT_IMPACT_TO_PROCEED_C','~','PROBLEM','~~~',SRC.u_pg_sufficient_impact_to_proceed)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_sufficient_impact_to_proceed IS NULL THEN 0 ELSE -1 END)<>TRGT.sufficient_impact_to_proceed_c_key

) temp; 


 