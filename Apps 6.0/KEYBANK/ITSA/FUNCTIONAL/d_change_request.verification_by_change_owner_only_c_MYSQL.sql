SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for d_change_request.verification_by_change_owner_only_c' ELSE 'SUCCESS' END as Message 
FROM
 keybank_mdsdb.change_request_final SRC
JOIN keybank_mdwdb.d_change_request TRGT  
ON 
(SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'

WHERE case when SRC.u_ver_change_owner=1 then 'Y' 
when SRC.u_ver_change_owner=0 then 'N' else 'X' end <>
 TRGT.verification_by_change_owner_only_c;