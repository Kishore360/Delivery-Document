SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,

CASE WHEN cnt > 0 THEN 'Data did not Match.'ELSE 'Data Matched' END AS Message 

from(select count(1) as cnt

from rambus_mdwdb.f_problem a

INNER JOIN rambus_mdsdb.problem_final b 

ON a.row_id =b.sys_id
 
AND a.source_id=b.sourceinstance


where a.cost_to_resolve_c<>COALESCE(b.u_cost_to_resolve,0)) z ;