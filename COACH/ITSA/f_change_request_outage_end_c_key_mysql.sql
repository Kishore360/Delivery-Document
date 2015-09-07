SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.change_request_final a
 left  JOIN  coach_mdwdb.f_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
left join coach_mdwdb.d_calendar_date c
on  DATE_FORMAT(CONVERT_TZ(a.u_outage_end,'GMT','America/New_York'),'%Y%m%d')= c.row_id 
where b.outage_end_c_key <> case when a.u_system_down_time = 'Yes Downtime' then c.row_key else 0 end )b