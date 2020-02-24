	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.outside_maintenance_schedule_flag' ELSE 'SUCCESS' END as Message
from (select assigned_to,a.sys_id,b.name name,a.sourceinstance ,CASE
WHEN lower(b.name) like '%srv%' then 'Y'

ELSE 'N' 
end as programmer_automated_flag
from  fidelity_mdsdb.change_request_final a
left join  fidelity_mdsdb.sys_user_final b on assigned_to=b.sys_id WHERE  a.CDCTYPE<>'D'
  and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT programmer_automated_flag_c,row_id,source_id FROM  fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE programmer_automated_flag<> COALESCE(TRGT.programmer_automated_flag_c ,'')
 
 
 