SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt

from pgi_mdwdb.f_change_request a

left join pgi_mdsdb.change_request_final b

on a.row_id=b.sys_id and

a.source_id=b.sourceinstance 

left join pgi_mdwdb.d_lov c

on c.row_id=concat('SUB_CATEGORY','~','CHANGE_REQUEST','~','~','~',b.u_sub_category)

where a.sub_category_src_c_key<>c.row_key) a;