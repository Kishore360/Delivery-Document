SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.u_csd_notification_plan_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE substring(COALESCE(SRC.u_csd_notification_plan,'UNSPECIFIED'),1,255)<>TRGT.u_csd_notification_plan_c
AND SRC.cdctype='X' ) temp;
