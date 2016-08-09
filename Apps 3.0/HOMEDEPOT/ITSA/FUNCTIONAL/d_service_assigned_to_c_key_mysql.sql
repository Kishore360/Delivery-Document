SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_service_final a
left JOIN homedepot_mdwdb.d_service b
on concat('BUSINESS_SERVICE~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
left join homedepot_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.assigned_to) = c.row_id
and a.sourceinstance = c.source_id
where case when assigned_to is NULL then 0
when c.row_id is NULL and assigned_to is not NULL then -1
else
c.row_key <> b.assigned_to_c_key end ) b 