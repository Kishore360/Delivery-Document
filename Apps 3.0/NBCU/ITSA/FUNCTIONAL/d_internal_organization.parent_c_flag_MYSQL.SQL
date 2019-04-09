SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(1) as cnt
from  nbcu_mdwdb.d_internal_organization a11
left join nbcu_mdsdb.sys_user_group_final a12
on a11.row_id= concat('Group~',a12.sys_id )and a11.source_id=a12.sourceinstance
where case when (a12.u_is_parent  = 1) then 'Y' else 'N' end <>a11.parent_c_flag)a
