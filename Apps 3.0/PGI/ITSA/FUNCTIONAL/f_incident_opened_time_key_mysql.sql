SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from pgi_mdwdb.f_incident ds

JOIN pgi_mdsdb.incident_final inc

on ds.row_id=inc.sys_id and 

ds.source_id=inc.sourceinstance

left join pgi_mdwdb.d_calendar_time c

on COALESCE(DATE_FORMAT(CONVERT_TZ(inc.sys_created_on,'GMT','UTC'),'%H%i'),'UNSPECIFIED')= c.row_id
where ds.opened_time_key<>c.row_key) a;
