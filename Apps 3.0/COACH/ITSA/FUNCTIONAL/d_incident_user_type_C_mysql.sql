
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.incident_final a
left  JOIN coach_mdwdb.d_incident b 
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id 
left join coach_mdsdb.sys_user_final c
on a.u_affected_user=c.sys_id
where COALESCE(c.u_user_type,'UNSPECIFIED') <> b.user_type_c ) tmp;