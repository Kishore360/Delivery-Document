SELECT 
CASE WHEN CNT  > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  > 0  THEN 'MDS to DWH data validation failed for d_change_request.u_review_not_required_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM jhi_mdsdb.change_request_final  SRC 
LEFT JOIN jhi_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
WHERE CASE WHEN SRC.u_review_not_required=1 then 'Y' else 'N' end<> (TRGT.u_review_not_required_flag_c) 
AND SRC.cdctype='X'
) temp; 
