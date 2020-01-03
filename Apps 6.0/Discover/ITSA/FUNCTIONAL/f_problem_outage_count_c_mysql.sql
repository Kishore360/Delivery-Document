SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_problem.outage_count_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) AS CNT
FROM discover_mdsdb.problem_final SRC
LEFT JOIN discover_mdwdb.f_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE (SRC.u_outage_count)<>TRGT.outage_count_c
AND SRC.cdctype='X'
) temp;