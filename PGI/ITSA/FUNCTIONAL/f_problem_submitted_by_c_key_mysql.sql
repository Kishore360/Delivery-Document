SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 

from pgi_mdwdb.f_problem a

left join pgi_mdsdb.problem_final b

on a.row_id=b.sys_id

left join d_internal_contact c

on c.row_id=concat('INTERNAL_CONTACT~',b.u_submitted_by)

where a.submitted_by_c_key<>c.row_key) a;