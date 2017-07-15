SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.OPEN_TO_CLOSE_DURATION' ELSE 'SUCCESS' END as Message
 from
 (SELECT f.row_id ,src.sys_id,
case when d.over_due_flag='Y' AND  d.closed_on > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d.closed_on) else 0 end as res,
f.overdue_duration
from rambus_mdwdb.f_request_task f 
RIGHT JOIN rambus_mdsdb.sc_task_final src on f.row_id = src.sys_id and f.source_id = src.sourceinstance
LEFT join rambus_mdwdb.d_request_task d on d.row_key = f.request_task_key  
JOIN rambus_mdwdb.d_lov_map br ON f.state_src_key = br.src_key AND br.dimension_wh_code in ('CLOSED','RESOLVED')
where f.overdue_duration <>
(case when d.over_due_flag='Y' AND  d.closed_on > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d.closed_on) else 0 end)  AND
(ABS(f.overdue_duration -
(case when d.over_due_flag='Y' AND  d.closed_on > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d.closed_on) else 0 end)) <>3600)) temp
 ; 

