SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 

from pgi_mdwdb.d_internal_organization a

left join pgi_mdsdb.sys_user_group_final b

on right(a.row_id,32)=b.sys_id and

a.source_id=b.sourceinstance

where a.support_tier_type_c <> b.u_support_tier_type ) c

