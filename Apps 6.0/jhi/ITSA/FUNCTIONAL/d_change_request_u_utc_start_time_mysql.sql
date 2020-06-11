SELECT 
CASE WHEN CNT  > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  > 0  THEN 'MDS to DWH data validation failed for d_change_request.u_utc_start_time_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM jhi_mdsdb.change_request_final  SRC 
LEFT JOIN jhi_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE COALESCE(SRC.u_utc_start_time,'UNSPECIFIED')<> (TRGT.u_utc_start_time_c) 
AND SRC.cdctype='X'
) temp; 



