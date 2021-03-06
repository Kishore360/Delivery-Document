SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 
from pgi_mdsdb.problem_final a

left join pgi_mdwdb.d_problem b

on b.review_end_date_c=convert_tz(a.u_end,"GMT","UTC")
where b.review_end_date_c<>convert_tz(a.u_end,"GMT","UTC")) a;