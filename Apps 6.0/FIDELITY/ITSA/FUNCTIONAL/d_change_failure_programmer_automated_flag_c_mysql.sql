	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.outside_maintenance_schedule_flag' ELSE 'SUCCESS' END as Message
from (select assigned_to,b.sys_id,b.name name,a.sourceinstance ,CASE
WHEN lower(b.name) like '%srv%' then 'Y'

when assigned_to is null then 'X'
when assigned_to is not  null and b.sys_id is null then 'X'
ELSE 'N' 
end as programmer_automated_flag
from  fidelity_mdsdb.change_request_final a
left join  fidelity_mdsdb.sys_user_final b on assigned_to=b.sys_id WHERE  a.CDCTYPE<>'D') SRC
left join (SELECT * FROM   fidelity_mdwdb.d_change_failure where current_flag='Y' 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE programmer_automated_flag<> TRGT.programmer_automated_flag_c 
 
 
 
 