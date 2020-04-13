SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.downtime_start_time_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM rogers6_mdsdb.change_request_final SRC 
JOIN rogers6_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE     CONVERT_TZ(SRC.u_downtime_start_time, 'GMT','America/New_York')<>
 TRGT.downtime_start_time_c
AND SRC.cdctype='X' ) temp;