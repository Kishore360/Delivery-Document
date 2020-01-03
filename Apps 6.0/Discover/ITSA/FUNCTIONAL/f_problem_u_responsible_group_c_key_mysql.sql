SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_problem.problem_responsible_group_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM discover_mdsdb.problem_final SRC 
LEFT JOIN discover_mdwdb.f_problem TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN discover_mdwdb.d_internal_organization LKP ON (CONCAT('GROUP','~',SRC.u_responsible_group)=LKP.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_responsible_group IS NULL THEN 0 ELSE -1 END)<>TRGT.problem_responsible_group_c_key
AND SRC.cdctype='X'
) temp;