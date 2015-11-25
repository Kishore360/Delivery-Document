

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

from(select count(1) cnt
 
from rambus_mdwdb.d_problem a 

left outer join rambus_mdsdb.problem_final b 

on a.row_id =b.sys_id 

and a.source_id=b.sourceinstance

where a.major_problem_c_flag<> CASE WHEN b.u_major_problem=1 THEN 'Y' ELSE 'N' END) z;