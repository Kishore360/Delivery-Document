SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from homedepot_mdsdb.incident_final a
left join homedepot_mdwdb.d_problem c
on coalesce(a.problem_id,'UNSPECIFIED') = c.row_id  and c.source_id=a.sourceinstance
left  JOIN homedepot_mdwdb.f_incident b 
 on  b.ROW_ID=a.sys_id and b.source_id=a.sourceinstance
 where coalesce(c.row_key,0) <> b.problem_key )b