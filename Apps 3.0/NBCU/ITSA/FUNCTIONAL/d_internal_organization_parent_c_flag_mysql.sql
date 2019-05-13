SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(1) as cnt
from  nbcu_mdsdb.sys_user_group_final a12
left join nbcu_mdwdb.d_internal_organization a11
on concat('Group~',a12.sys_id )=a11.row_id and a12.sourceinstance=a11.source_id
where case when (a12.u_is_parent = 1) then 'Y' else 'N' end <>a11.parent_c_flag
and a11.soft_deleted_flag='N')a
