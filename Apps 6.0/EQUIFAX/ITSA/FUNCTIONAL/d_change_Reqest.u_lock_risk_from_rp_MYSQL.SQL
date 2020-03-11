SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_Reqest.u_lock_risk_from_rp' ELSE 'SUCCESS' END as Message 

from

(
select count(1) as cnt from(select sys_id, sourceinstance,u_lock_risk_from_rp from equifax_mdsdb.change_request_final where CDCTYPE<>'D') src
left join  equifax_mdwdb.d_change_request trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id

where (case when u_lock_risk_from_rp
=0  THEN 'N' ELSE 'Y' END) <> trgt.u_lock_risk_from_rp_c and src.cdctype<>'D'
) temp;