SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT 
Count(1) as CNT 
From ntt_om_mdsdb.change_request_final SRC 
LEFT JOIN ntt_om_mdwdb.d_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
CASE   
WHEN coalesce(SRC.u_state_reason,'UNSPECIFIED') ='UNSPECIFIED' then 'Y' 
WHEN coalesce(SRC.u_state_reason, 'UNSPECIFIED') ='Cancelled' then 'Y' 
WHEN coalesce(SRC.u_state_reason, 'UNSPECIFIED') ='Failed' then 'Y' else 'N'  END  <> TRGT.failure_flag
) temp;

