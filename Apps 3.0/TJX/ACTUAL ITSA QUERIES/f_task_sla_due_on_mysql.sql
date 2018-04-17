
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_sla.due_on' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
from tjx_mdsdb.task_sla_final a
JOIN tjx_mdwdb.f_task_sla b ON a.sys_id =b.row_id and a.sourceinstance=b.source_id
where convert_tz(a.planned_end_time,'GMT','America/New_York')<> b.due_on )temp;

 