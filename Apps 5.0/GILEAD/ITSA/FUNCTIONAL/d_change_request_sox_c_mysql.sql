
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.u_sox_c' 
ELSE 'MDS to DWH data validation passed for d_change_request.u_sox_c' END as Message from 
(select count(1) as cnt 
FROM gilead_mdsdb.change_request_final SRC 
JOIN gilead_mdwdb.d_change_request TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id   
WHERE case when SRC.u_sox =0 then 'N' else 'Y' end <> TRGT. u_sox_c and SRC.cdctype='X')b
