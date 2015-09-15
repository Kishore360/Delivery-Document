

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.incident_final a
left JOIN coach_mdwdb.f_incident b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
left  JOIN  coach_mdwdb.d_location c
on a.u_parent_location= c.row_id and a.sourceinstance=c.source_id
where 
case when u_parent_location is NULL then 0 
when c.row_id is NULL and u_parent_location is not NULL then -1 
else
c.row_key end <> b.parent_location_c_key )b