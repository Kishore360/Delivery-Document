SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  watson_mdsdb.sys_user_final a11
 join watson_mdwdb.d_internal_contact  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where u_work_location    <>a12.u_work_location_c )a


