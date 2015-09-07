SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.change_request_final a
 left  JOIN  coach_mdwdb.d_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
where b.outage_start_c <>
CONVERT_TZ(a.u_outage_start,'GMT','America/New_York')
  and a.u_system_down_time = 'Yes Downtime' )b

