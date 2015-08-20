
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

from(select count(1) cnt
 
from rambus_mdwdb.d_problem a 

left outer join rambus_mdsdb.problem_final b 

on a.row_id =b.sys_id 

and a.source_id=b.sourceinstance

where coalesce(a.workaround_on_c,'')<>coalesce(CONVERT_TZ(b.u_workaround_date,'GMT','America/Los_Angeles'),'')