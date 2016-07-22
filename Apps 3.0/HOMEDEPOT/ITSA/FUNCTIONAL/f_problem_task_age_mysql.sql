SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.u_problem_task_final a
 left  JOIN   homedepot_mdwdb.f_problem_task b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where TIMESTAMPDIFF(HOUR,a.closed_at,a.opened_at) <> b.age_c) temp;

 -- wrong
 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.u_problem_task_final a
 left  JOIN   homedepot_mdwdb.f_problem_task b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
JOIN homedepot_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
 where TIMESTAMPDIFF(HOUR,a.closed_at,a.opened_at) <> b.age_c) temp;
 
 
 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<>TRGT.priority_src_key)temp;

convert_tz(a.opened_at,'GMT','America/New_York')

convert_tz(a.closed_at,'GMT','America/New_York')