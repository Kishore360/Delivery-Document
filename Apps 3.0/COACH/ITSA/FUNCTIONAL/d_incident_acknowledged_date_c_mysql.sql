 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.incident_final a
 left  JOIN  coach_mdwdb.d_incident b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
where  (CONVERT_TZ(a.u_acknowledge_timestamp,'GMT','America/New_York'))<> b.acknowledged_date_c )c

