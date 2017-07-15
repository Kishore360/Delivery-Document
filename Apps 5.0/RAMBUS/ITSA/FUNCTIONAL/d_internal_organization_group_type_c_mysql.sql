SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message
from(select b.sys_id,a.row_id,a.group_type_c,coalesce(b.u_group_type,'UNSPECIFIED')
from rambus_mdwdb.d_internal_organization a 
RIGHT JOIN rambus_mdsdb.sys_user_group_final b
on a.row_id =CONCAT('GROUP~',b.sys_id) and a.source_id=b.sourceinstance
where a.group_type_c = coalesce(b.u_group_type,'UNSPECIFIED')) z; 



 