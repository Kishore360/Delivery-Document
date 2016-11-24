


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.incident_final src
 join wow_mdwdb.d_incident trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id where
trgt.power_supply_type_c<>src.u_power_supply_type)a;

