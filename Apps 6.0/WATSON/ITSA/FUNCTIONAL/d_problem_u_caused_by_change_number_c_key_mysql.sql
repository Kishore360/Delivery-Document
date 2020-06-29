
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_problem_caused_by_change_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM ibmwatson_mdsdb.problem_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN ibmwatson_mdwdb.d_change_request LKP ON u_caused_by_change_number=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_caused_by_change_number IS NULL THEN 0 ELSE -1 END)=TRGT.u_caused_by_change_number_c_key
AND SRC.cdctype='X'
) temp; 

