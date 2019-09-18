SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for d_chnage_request.user_validation_by_operations_lob_c' ELSE 'SUCCESS' END as Message 
FROM 
keybank_mdsdb.change_request_final SRC
JOIN keybank_mdwdb.d_change_request TRGT  
ON
 (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'

WHERE case when SRC.u_user_val_ops=1 then 'Y' 
when SRC.u_user_val_ops=0 then 'N' else 'X' end <> 
TRGT.user_validation_by_operations_lob_c;