SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_incident_start_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) AS CNT
FROM discover_mdsdb.problem_final SRC
LEFT JOIN discover_mdwdb.d_problem TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE convert_tz(SRC.u_incident_start,'GMT','America/New_York')<>TRGT.u_incident_start_c
AND SRC.cdctype='X'
) temp;