SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.downtime_required_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM rogers6_mdsdb.change_request_final SRC 
JOIN rogers6_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE     case when SRC.u_downtime_required=1 then 'Y' else 'N' end<>
 TRGT.downtime_required_c_flag
AND SRC.cdctype='X' ) temp;