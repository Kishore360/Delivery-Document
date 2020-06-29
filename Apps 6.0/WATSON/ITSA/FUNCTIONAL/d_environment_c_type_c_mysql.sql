SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt 
from  ibmwatson_mdsdb.cmdb_ci_environment_final a11
 join ibmwatson_mdwdb.d_environment_c  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where coalesce(a11.u_type,'UNSPECIFIED')<>a12.type_c and a12.soft_deleted_flag='N')a


