SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(1) as cnt
from  ibmwatson_mdsdb.problem_final a11
left join ibmwatson_mdwdb.d_lov d on d.row_id=concat('AFFECTED_ACTIVITY_C~PROBLEM~',u_affected_activity)
 join ibmwatson_mdwdb.d_problem  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where affected_activity_src_c_key  <>coalesce(d.row_key,case when a11.u_affected_activity is null then 0 else -1 end ))a



