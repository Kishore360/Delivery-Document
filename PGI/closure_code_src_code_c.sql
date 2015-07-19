SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cn
t
from pgi_mdwdb.f_problem a

left join pgi_mdsdb.problem_final b

on a.row_id=b.sys_id
and a.source_id=b.sourceinstance

where a.closure_code_src_code_c<>b.u_closure_code) a;