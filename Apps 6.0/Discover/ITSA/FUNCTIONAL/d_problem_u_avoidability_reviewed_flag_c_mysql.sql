SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_avoidability_reviewed_flag_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) AS CNT
FROM discover_mdsdb.problem_final SRC
LEFT JOIN discover_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE (CASE WHEN SRC.u_avoidability_reviewed = 1 then 'Y' else 'N' END)<>TRGT.u_avoidability_reviewed_flag_c
AND SRC.cdctype='X'
) temp;