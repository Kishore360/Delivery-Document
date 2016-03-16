SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from richemont_mdsdb.incident_final a
left  JOIN richemont_mdwdb.f_incident b 
on a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id 
where COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',a.time_worked),0) <> b.time_worked ) temp