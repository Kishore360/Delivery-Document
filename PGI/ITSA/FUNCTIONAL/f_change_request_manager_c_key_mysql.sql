SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt

from pgi_mdwdb.f_change_request a

left join pgi_mdsdb.change_request_final b

on a.row_id=b.sys_id and

a.source_id=b.sourceinstance 

left join pgi_mdwdb.d_internal_contact c

on c.row_id=concat('INTERNAL_CONTACT~',b.u_which_manager)

where a.manager_c_key<>c.row_key) a;