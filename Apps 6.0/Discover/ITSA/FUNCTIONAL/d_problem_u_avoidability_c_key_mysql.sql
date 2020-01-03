SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_avoidability_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM discover_mdsdb.problem_final SRC 
LEFT JOIN discover_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN discover_mdwdb.d_lov LKP ON (CONCAT('U_AVOIDABILITY','~','PROBLEM','~',SRC.u_avoidability)=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_avoidability IS NULL THEN 0 ELSE -1 END)<>TRGT.u_avoidability_c_key
AND SRC.cdctype='X'
) temp; 
