SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from pgi_mdwdb.d_incident a

JOIN pgi_mdsdb.incident_final b

on a.row_id=b.sys_id and a.source_id=b.sourceinstance

where a.OPENED_ON<>CONVERT_TZ(b.sys_created_on,'GMT','UTC')) a;