SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for d_chnage_request.going_to_cab_c' ELSE 'SUCCESS' END as Message 
FROM 
keybank_mdsdb.change_request_final SRC
JOIN keybank_mdwdb.d_change_request TRGT  
ON 
(SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' 

WHERE case when SRC.cab_required=1 then 'Y' 
when SRC.cab_required=0 then 'N' else 'X' end <> TRGT.going_to_cab_c;