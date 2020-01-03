SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.u_team_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) AS CNT
FROM discover_mdsdb.sys_user_final SRC
LEFT JOIN discover_mdwdb.d_internal_contact TRGT ON (CONCAT('INTERNAL_CONTACT~',SRC.sys_id)=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE SRC.u_team<>TRGT.u_team_c
AND SRC.cdctype='X'
) temp;