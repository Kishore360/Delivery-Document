SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_final a
left JOIN homedepot_mdwdb.d_configuration_item b
on a.sys_id= b.row_id and a.sourceinstance=b.source_id
left join homedepot_mdsdb.sys_db_object_final sysdb
on a.sys_class_name=sysdb.name and a.sourceinstance=sysdb.sourceinstance
left join homedepot_mdsdb.cmdb_ci_server_final sev
on a.sys_id=sev.sys_id and a.sourceinstance=sev.sourceinstance
where sev.u_patch_server_role <> b.patch_server_role_c ) temp;

