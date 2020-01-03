SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_sdlc_prevention_activity_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM discover_mdsdb.problem_final SRC 
LEFT JOIN discover_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN discover_mdwdb.d_lov LKP ON (CONCAT('U_SDLC_PREVENTION_ACTIVITY','~','PROBLEM','~',SRC.u_sdlc_prevention_activity)=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_sdlc_prevention_activity IS NULL THEN 0 ELSE -1 END)<>TRGT.u_sdlc_prevention_activity_c_key
AND SRC.cdctype='X'
) temp;