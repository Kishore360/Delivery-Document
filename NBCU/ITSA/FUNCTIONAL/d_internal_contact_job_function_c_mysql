SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.d_internal_contact a11
left join nbcu_mdsdb.sys_user_final a12 
on concat('INTERNAL_CONTACT~',a12.sys_id )= a11.row_id 
and a11.source_id=a12.sourceinstance
where a12.u_job_function <> a11.job_function_c)a