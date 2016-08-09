SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.u_cmdb_ci_service_prod_env_final a
LEFT JOIN homedepot_mdsdb.u_authentication_solution_final LKP 
 ON ( a.u_authentication_solution= LKP.sys_id 
AND a.sourceinstance= LKP.sourceinstance )
left JOIN homedepot_mdwdb.d_service b
on concat('BUSINESS_SERVICE~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
WHERE LKP.u_name<>b.authentication_solution_c)temp; 
