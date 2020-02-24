SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_problem.related_incidents_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) AS CNT
FROM discover_mdsdb.problem_final SRC
LEFT JOIN discover_mdwdb.f_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE (SRC.u_related_incidents)<>TRGT.related_incidents_c
AND SRC.cdctype='X'
) temp;