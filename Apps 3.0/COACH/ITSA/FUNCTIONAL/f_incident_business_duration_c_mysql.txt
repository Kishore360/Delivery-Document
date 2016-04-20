SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message FROM 
(
select count(1) as cnt 
from coach_mdsdb.incident_final a  
left  JOIN  coach_mdwdb.f_incident b 
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id where (timestampdiff(SECOND, '1970-01-01 00:00:00'  a.business_duration)) <> b.business_duration_c )c

