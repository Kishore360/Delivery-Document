SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from ldb.f_incident a
left join pgi_mdwdb.d_incident b
on a.incident_key=b.row_key and a.source_id=b.source_id
where a.days_since_create_date_c<>datediff(hours,b.created_on,(SELECT MAX(lastupdated) AS lastupdated
FROM pgi_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))/24 ) z;

