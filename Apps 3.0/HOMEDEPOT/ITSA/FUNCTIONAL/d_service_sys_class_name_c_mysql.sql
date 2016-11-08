SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_service_final a
left JOIN homedepot_mdwdb.d_service b
on CONCAT('BUSINESS_SERVICE~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
where a.sys_class_name <> b.sys_class_name_c ) temp;