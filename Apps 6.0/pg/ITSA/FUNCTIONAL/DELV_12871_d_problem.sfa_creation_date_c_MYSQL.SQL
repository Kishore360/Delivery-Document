SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.sfa_creation_date_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM png_mdsdb.problem_final SRC 
LEFT JOIN png_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CONVERT_TZ(SRC.u_pg_sfa_creation_date,'GMT','America/New_York')<>TRGT.sfa_creation_date_c
) temp; 




 