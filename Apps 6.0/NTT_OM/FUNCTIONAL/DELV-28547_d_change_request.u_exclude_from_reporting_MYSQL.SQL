SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_exclude_from_reporting' ELSE 'SUCCESS' END as Message
FROM
(
SELECT
Count(1) as CNT 
From ntt_om_mdsdb.change_request_final SRC 
LEFT JOIN ntt_om_mdwdb.d_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN SRC.u_exclude_from_reporting=1 THEN 'Y' ELSE 'N' END <> TRGT.exclude_from_reporting_flag_c
AND SRC.cdctype='X'
) temp;


 