SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select b.mean_down_time_c , timestampdiff(SECOND,a.u_outage_start,a.u_outage_end)  as x
from coach_mdsdb.change_request_final a
left  JOIN  coach_mdwdb.f_change_request b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
where u_system_down_time= 'Yes Downtime' and 
(timestampdiff(MINUTE,a.u_outage_start,a.u_outage_end)
) <> b.mean_down_time_c
)b