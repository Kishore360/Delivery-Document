SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.d_incident a11
left join nbcu_mdsdb.incident_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
where case when (a12.u_first_call_resolution_flag = 1) then 'Y' else 'N' end <>a11.first_call_resolution_flag)a