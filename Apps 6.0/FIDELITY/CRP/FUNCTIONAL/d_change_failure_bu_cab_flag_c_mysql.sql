SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 
fidelity_mdsdb.change_request_final  SRC 

JOIN fidelity_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE  SRC.CDCTYPE<>'D'  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' and year(TRGT.effective_to)=2999 and (CASE WHEN SRC.u_bu_cab = 1 then 'Y' else 'N' END) <> (TRGT.u_bu_cab_flag_c) and SRC.cdctype<>'D' ) temp;
