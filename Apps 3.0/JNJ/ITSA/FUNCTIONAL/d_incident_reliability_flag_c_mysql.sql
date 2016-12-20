SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from jnj_mdsdb.incident_final a
JOIN jnj_mdwdb.d_incident b
on a.sys_id= b.row_id and a.sourceinstance=b.source_id
WHERE case when u_reliability=1 then 'Y' else 'N' end<>b.reliability_c_flag)temp; 

