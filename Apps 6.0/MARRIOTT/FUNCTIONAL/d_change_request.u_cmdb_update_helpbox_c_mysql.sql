select CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.u_cmdb_update_helpbox_c' ELSE 'SUCCESS' END as Message
from marriott_mdsdb.change_request_final s  
left join marriott_mdwdb.d_change_request t  on t.row_id=s.sys_id and t.source_id=s.sourceinstance
where s.cdctype<>'D' and 
t.u_cmdb_update_helpbox_c<>(case when u_cmdb_update_helpbox=0 then 'N' when u_cmdb_update_helpbox=1 then 'Y' end)