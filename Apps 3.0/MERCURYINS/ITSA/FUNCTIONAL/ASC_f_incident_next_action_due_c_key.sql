

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from mercuryins_mdsdb.u_asc_ticket_final a
left JOIN mercuryins_mdwdb.f_incident_asc_c b
on 
a.sys_id=b.row_id AND a.sourceinstance=b.source_id
LEFT  JOIN  mercuryins_mdwdb.d_calendar_date c
on DATE_FORMAT(CONVERT_TZ(a.u_next_action_due_date,'GMT','America/Los_Angeles'),'%Y%m%d')= c.row_id

 where  c.row_key<>b.asc_incident_next_action_due_c_key )b