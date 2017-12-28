




SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.incident_final a
left  JOIN asu_mdwdb.d_incident b 
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id 
where CONVERT_TZ (a.sys_updated_on,'GMT','US/Mountain') <>b.changed_on) b
