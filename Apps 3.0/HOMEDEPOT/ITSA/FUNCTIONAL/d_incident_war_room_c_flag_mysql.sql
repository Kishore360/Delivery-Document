SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.incident_final a
 left  JOIN   homedepot_mdwdb.d_incident b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where case when a.u_war_room = '0' then 'N' else 'Y' end <> b.war_room_c_flag)temp; 