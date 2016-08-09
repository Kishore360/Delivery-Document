SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_appl_final a
left JOIN homedepot_mdwdb.d_application b
on concat('APPLICATION~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
left join homedepot_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_patch_vp) = c.row_id
and a.sourceinstance = c.source_id
where 
case when a.u_patch_vp is NULL then 0
when c.row_id is NULL and a.u_patch_vp is not NULL then -1
else
c.row_key <> b.patch_vp_c_key end ) b
