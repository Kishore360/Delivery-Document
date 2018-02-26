SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
 select count(1) as cnt-- u_success_status, oldvalue, newvalue,a.SYS_ID,b.change_ever_failed_c_flag ,d.documentkey
from cardinalhealth_mdsdb.change_request_final a
 left  JOIN  cardinalhealth_mdwdb.d_change_request b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 join   cardinalhealth_mdsdb.sys_audit_final d
on a.sys_id=d.documentkey and d.tablename = 'change_request' and  
 d.fieldname = 'u_success_status'
 where   
case when  a.u_success_status='Failed' or oldvalue='Failed' or newvalue='Failed' then 'Y' 
    else 'N' end

 <> b.change_ever_failed_c_flag  )b
 
