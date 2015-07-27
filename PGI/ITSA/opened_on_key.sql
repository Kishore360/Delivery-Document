SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 

from pgi_mdwdb.f_incident a

JOIN pgi_mdsdb.incident_final b

on a.row_id=b.sys_id 
and a.source_id=b.sourceinstance

left join pgi_mdwdb.d_calendar_date c

on COALESCE(DATE_FORMAT(CONVERT_TZ(b.sys_created_on,'GMT','UTC'),'%Y%m%d'),'UNSPECIFIED')=c.row_id

where a.opened_on_key<> c.row_key) a;