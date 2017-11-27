

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  watson_mdsdb.problem_final a11
left join watson_mdwdb.d_incident d 
on row_id=u_incident
 join watson_mdwdb.f_problem  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
where coalesce(row_key,case when u_incident is null then 0 else -1 end  ) <>a12.incident_key )a


