SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 
from pgi_mdsdb.incident_final a 

inner join pgi_mdwdb.f_incident b  

on a.sys_id=b.row_id and 

a.sourceinstance=b.source_id 

where  a.sys_mod_count <> b.updated_incident_count_c ) c