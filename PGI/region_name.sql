SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 

from pgi_mdwdb.d_internal_organization a

left join pgi_mdsdb.sys_user_group_final b

on a.row_id=concat('GROUP~',b.sys_id) and

a.source_id=b.sourceinstance

left join pgi_mdsdb.u_region_final c

on b.u_region=c.sys_id

where a.region_name_c <> c.u_name) a;