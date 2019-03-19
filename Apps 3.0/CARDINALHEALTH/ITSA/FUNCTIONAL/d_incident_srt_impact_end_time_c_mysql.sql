
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.incident_final a
JOIN  cardinalhealth_mdwdb.d_incident b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
where convert_tz(a.u_srt_impact_end_time,'GMT','America/New_York')<> b.srt_impact_end_time_c)c


