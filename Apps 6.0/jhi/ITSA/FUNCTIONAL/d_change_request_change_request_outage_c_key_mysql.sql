SELECT 
CASE WHEN CNT  > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  > 0  THEN 'MDS to DWH data validation failed for d_change_request.change_request_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM jhi_mdsdb.change_request_final  SRC 
LEFT JOIN jhi_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN jhi_mdwdb.d_lov LKP ON ( concat( 'U_OUTAGE_C~CHANGE_REQUEST~' ,upper( SRC.u_outage)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_outage IS NULL THEN 0 else -1 end)<> (TRGT.change_request_outage_c_key) 
AND SRC.cdctype='X'
) temp;
