SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_appl_final a
left JOIN homedepot_mdwdb.d_application b
on concat('APPLICATION~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
left join homedepot_mdwdb.d_internal_organization c
on concat('GROUP~',a.support_group) = c.row_id
and a.sourceinstance = c.source_id
WHERE c.full_name <>b.support_group)temp; 
