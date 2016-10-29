SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt

from pgi_mdsdb.problem_final a

left join pgi_mdwdb.d_problem b

on a.sys_id=b.row_id and

a.sourceinstance=b.source_id

where a.u_rfc_text<>b.rfc_text_c) a;