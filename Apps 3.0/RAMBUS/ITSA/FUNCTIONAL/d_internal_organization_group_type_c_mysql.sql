
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message
from(select count(1) cnt
from rambus_mdwdb.d_internal_organization a 
left outer join rambus_mdsdb.sys_user_group_final b
on a.row_id =CONCAT('GROUP~',b.sys_id) 
and a.source_id=b.sourceinstance
where coalesce(a.group_type_c,'UNSPECIFIED')<>coalesce(b.u_group_type,'UNSPECIFIED') ) z; 