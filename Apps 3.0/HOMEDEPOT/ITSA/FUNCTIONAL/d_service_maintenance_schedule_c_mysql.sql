SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_service_final a
LEFT JOIN homedepot_mdsdb.cmn_schedule_final LKP 
 ON ( a.maintenance_schedule= LKP.sys_id 
AND a.sourceinstance= LKP.sourceinstance )
left JOIN homedepot_mdwdb.d_service b
on concat('BUSINESS_SERVICE~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
WHERE LKP.name<>b.maintenance_schedule_c)temp; 