SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_previous_problem_state_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM ingrammicro_mdsdb.problem_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_previous_problem_state,'UNSPECIFIED')<>TRGT.u_previous_problem_state_c
AND SRC.cdctype='X' ) temp; 
