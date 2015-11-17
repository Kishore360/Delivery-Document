
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from pan_mdsdb.incident_final a
left join pan_mdwdb.d_incident c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where c.major_incident_flag <> CASE WHEN a.u_major_incident=1 THEN 'Y' ELSE 'N'END) g