 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from starwood_mdsdb.incident_final a
 left  JOIN  starwood_mdwdb.d_incident b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where  a.u_property_name <> b.property_name_c )b