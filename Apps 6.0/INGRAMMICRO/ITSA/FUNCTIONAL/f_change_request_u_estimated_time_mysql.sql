SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.u_estimated_time_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC 
LEFT JOIN ingrammicro_mdwdb.f_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE timestampdiff(second,'1970-01-01 00:00:00',SRC.u_estimated_time)<>TRGT.u_estimated_time_c
AND SRC.cdctype='X' ) temp; 