SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 
from pgi_mdsdb.problem_final a
left join pgi_mdwdb.d_problem b

on b.incident_date_c=convert_tz(u_date_of_incident,'GMT','UTC')

where b.incident_date_c<>convert_tz(u_date_of_incident,'GMT','UTC')) a;