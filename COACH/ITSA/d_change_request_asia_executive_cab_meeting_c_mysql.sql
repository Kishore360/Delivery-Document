


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.change_request_final a
left  JOIN coach_mdwdb.d_change_request b 
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id 
left join coach_mdsdb.task_final c
on a.u_Asia_executive_cab_meeting=c.sys_id
left join coach_mdsdb.sys_user_group d
on d.sys_id=c.assignment_group
where c.number <> b.Asia_executive_cab_meeting_c 
and d.name = 'Asia Executive Review Board') b