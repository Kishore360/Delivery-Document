SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
 select count(1) cnt
from cardinalhealth_mdsdb.change_request_final a
 left  JOIN  cardinalhealth_mdwdb.d_change_request b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
join cardinalhealth_mdsdb.sys_audit_final d
on a.sys_id=d.documentkey
 where  d.tablename = 'change_request' and  
case when d.fieldname = 'u_success_status' 
and oldvalue='Failed' or newvalue='Failed' then 'Y' 
    else 'N' end

 <> b.change_ever_failed_c_flag  )b
 
 