SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_problem.problem_root_cause_responsibility_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM discover_mdsdb.problem_final SRC 
LEFT JOIN discover_mdwdb.f_problem TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN discover_mdwdb.d_internal_organization LKP ON (CONCAT('GROUP','~',SRC.u_root_cause_responsibility)=LKP.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_root_cause_responsibility IS NULL THEN 0 ELSE -1 END)<>TRGT.problem_root_cause_responsibility_c_key
AND SRC.cdctype='X'
) temp; 