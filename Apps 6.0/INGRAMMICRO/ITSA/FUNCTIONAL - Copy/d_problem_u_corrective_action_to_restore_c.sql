SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_corrective_action_to_restore_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM ingrammicro_mdsdb.problem_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(SRC.u_corrective_action_to_restore,'UNSPECIFIED')<>TRGT.u_corrective_action_to_restore_c
AND SRC.cdctype='X' ) temp; 
