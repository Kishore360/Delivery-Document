SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from ldb.f_incident a
left join pgi_mdwdb.d_incident b
on a.incident_key=b.row_key
join pgi_mdwdb.d_o_data_freshness c
on c.etl_run_number=(select max(c.etl_run_number) from pgi_mdwdb.d_o_data_freshness c)
where a.days_since_create_date_c<>datediff(hours,b.created_on,c.lastupdated)/24 ) z;

