
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.change_request_final a
left join coach_mdsdb.task_final c
 on c.sys_id=a.u_cab_meeting and a.sourceinstance=c.sourceinstance 
 left  JOIN coach_mdwdb.d_change_request b 
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id 
 where c.sys_class_name ='u_change_approval_board_meetin' and coalesce(c.number,'UNSPECIFIED') <> b.cab_meeting_c )b