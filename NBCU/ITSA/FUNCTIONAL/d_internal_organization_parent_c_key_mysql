SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.d_internal_organization a11
left join nbcu_mdsdb.sys_user_group_final a12
on a11.row_id= concat('GROUP~',a12.sys_id )and a11.source_id=a12.sourceinstance
left join nbcu_mdwdb.d_internal_organization a13
on concat('GROUP~',a12.parent )=a13.row_id 
where a13.row_key <>a11.parent_c_key )a