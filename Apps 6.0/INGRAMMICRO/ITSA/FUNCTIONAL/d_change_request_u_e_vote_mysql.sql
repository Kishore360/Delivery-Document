
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.u_e_vote_c' ELSE 'SUCCESS' END as Message 
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC
JOIN ingrammicro_mdwdb.d_change_request TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE case when SRC.u_e_vote=1 then 'Y' when SRC.u_e_vote=0 then 'N' else 'X' end
<>TRGT.u_e_vote_c;