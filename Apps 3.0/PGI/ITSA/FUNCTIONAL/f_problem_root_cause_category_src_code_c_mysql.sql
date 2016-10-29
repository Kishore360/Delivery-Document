SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt

from pgi_mdwdb.f_problem a

left join pgi_mdsdb.problem_final b

on a.row_id=b.sys_id
and a.source_id=b.sourceinstance

where a.root_cause_category_src_code_c<>b.u_root_cause_category) a;