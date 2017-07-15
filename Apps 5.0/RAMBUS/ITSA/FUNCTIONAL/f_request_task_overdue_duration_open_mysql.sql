SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.overdue_duration' ELSE 'SUCCESS' END as Message
FROM
(SELECT f.row_id ,src.sys_id,
(case when d.over_due_flag='Y' AND  d_o.lastupdated > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d_o.lastupdated) else 0 end)  as res,
f.overdue_duration
from rambus_mdwdb.f_request_task f 
RIGHT JOIN rambus_mdsdb.sc_task_final src on f.row_id = src.sys_id and f.source_id = src.sourceinstance
LEFT join rambus_mdwdb.d_request_task d on d.row_key = f.request_task_key  
JOIN rambus_mdwdb.d_lov_map br ON f.state_src_key = br.src_key AND br.dimension_wh_code='OPEN'
JOIN (select source_id,max(lastupdated) as lastupdated from rambus_mdwdb.d_o_data_freshness group by source_id) d_o
ON src.sourceinstance = d_o.source_id
where f.overdue_duration <>
(case when d.over_due_flag='Y' AND  d_o.lastupdated > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d_o.lastupdated) else 0 end)  AND
(ABS(f.overdue_duration -
(case when d.over_due_flag='Y' AND  d_o.lastupdated > d.due_on then TIMESTAMPDIFF(SECOND,d.due_on,d_o.lastupdated) else 0 end)) <>3600)
) temp;
