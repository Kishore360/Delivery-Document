SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_service_final a
left JOIN homedepot_mdwdb.d_configuration_item b
on a.sys_id= b.row_id and a.sourceinstance=b.source_id
left join homedepot_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_vice_president) = c.row_id
and a.sourceinstance = c.source_id
 where 
case when u_vice_president is NULL then 0
when c.row_id is NULL and u_vice_president is not NULL then -1
else
c.row_key <> b.vice_president_c_key end ) b

