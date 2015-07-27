SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt

from pgi_mdwdb.f_problem a

left join pgi_mdsdb.problem_final b

on a.row_id=b.sys_id

and a.source_id=b.sourceinstance

where a.highest_level_of_cust_impacted_src_code_c<>b.u_highest_level_of_customer_im) a;