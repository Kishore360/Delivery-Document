SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.first_call_resolution' ELSE 'SUCCESS' END as Message
FROM 
(select COUNT(1) AS CNT 
FROM equifax_mdsdb.problem_final SRC
LEFT JOIN equifax_mdwdb.d_problem TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE (case when SRC.u_first_call_resolution = 1 then  'Y' else 'N' end)<>TRGT.first_call_resolution_flag_c
)temp;
