SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt
from  watson_mdsdb.cmdb_ci_environment_final a11
 join watson_mdwdb.d_environment_c  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where a11.u_id<>a12.id_c )a


