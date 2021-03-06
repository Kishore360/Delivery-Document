SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from
fidelity_mdsdb.change_request_final  SRC 
JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE (CASE WHEN SRC.u_batch_onetime_aud_verified = 1 then 'Y' else 'N' END) <> (TRGT.batch_onetime_aud_verified_flag_c) and (
coalesce(SRC.work_start,SRC.start_date,SRC.closed_at)>'2019-01-01'
and SRC.u_environment='Production'
and TRGT.current_flag='Y'
and SRC.cdctype<>'D')) temp;
