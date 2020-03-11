 
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_request.change_slt_approver_c_key' ELSE 'SUCCESS' END as Message 
from
(select count(1) as cnt from(select sys_id, sourceinstance,u_slt_approver
 from equifax_mdsdb.change_request_final where CDCTYPE<>'D') src
left join  equifax_mdwdb.d_change_request trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id

left join equifax_mdwdb.d_internal_contact lkp on coalesce(concat('INTERNAL_CONTACT~',src.u_slt_approver),'UNSPECIFIED')=
lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_key,case when src.u_slt_approver is null then 0 else -1 end) <> trgt.change_slt_approver_c_key and src.cdctype<>'D'
) temp; 
 
