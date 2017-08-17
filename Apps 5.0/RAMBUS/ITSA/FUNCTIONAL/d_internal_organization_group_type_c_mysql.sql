SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN CNT > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message
from(
select count(1) as CNT
from rambus_mdwdb.d_internal_organization a 
RIGHT JOIN rambus_mdsdb.sys_user_group_final b
on a.row_id =COALESCE(CONCAT('GROUP~',b.sys_id),'UNSPECIFIED') and a.source_id=b.sourceinstance
where a.group_type_c <> coalesce(b.u_group_type,'UNSPECIFIED')
) z; 




