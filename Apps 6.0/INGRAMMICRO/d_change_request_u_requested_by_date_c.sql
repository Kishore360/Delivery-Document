SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_requested_by_date_c' ELSE 'SUCCESS' END as Message FROM 
(
SELECT Count(1) AS CNT 
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CONVERT_TZ(SRC.u_requested_by_date,'GMT',
                'America/Los_Angeles')<>TRGT.u_requested_by_date_c
AND SRC.cdctype='X' ) temp; 