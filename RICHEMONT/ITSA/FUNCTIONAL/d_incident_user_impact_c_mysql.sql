SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from richemont_mdsdb.incident_final a
left  JOIN richemont_mdwdb.d_incident b 
on b.row_id=a.sys_id
and b.source_id=a.sourceinstance
left join richemont_mdsdb.u_bs_user_impact_final c
on a.u_user_impact=c.sys_id
where c.u_name <> b.user_impact_c )temp;