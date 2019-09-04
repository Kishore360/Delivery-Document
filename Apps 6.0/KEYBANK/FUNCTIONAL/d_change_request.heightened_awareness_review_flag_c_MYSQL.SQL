SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.heightened_awareness_review_flag_c' ELSE 'SUCCESS' END as Message 
FROM keybank_mdsdb.change_request_final SRC
JOIN keybank_mdwdb.d_change_request TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE case when SRC.u_heightened_awareness_review=1 then 'Y' 
when SRC.u_heightened_awareness_review=0 then 'N' else 'X' end
<>TRGT.heightened_awareness_review_flag_c