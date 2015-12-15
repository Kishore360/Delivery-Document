SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.sys_user_group_type_final s
left join wow_mdsdb.sys_user_group_final c
on s.sourceinstance=c.sourceinstance and s.sys_id=c.type
left join wow_mdwdb.d_internal_organization t
on concat('GROUP~',c.sys_id)=t.row_id and c.sourceinstance=t.source_id 
where t.group_type_c <> s.name)g