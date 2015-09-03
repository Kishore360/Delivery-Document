SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message FROM
(select count(1) as cnt 
from <<tenant>>_mdwdb.d_incident a
join <<tenant>>_mdsdb.incident_final b
on a.row_id=b.sys_id 

and a.source_id=b.sourceinstance
 
where a.major_incident_flag<>case when b.u_major_incident=1 then 'Y' else 'N' end) a;




