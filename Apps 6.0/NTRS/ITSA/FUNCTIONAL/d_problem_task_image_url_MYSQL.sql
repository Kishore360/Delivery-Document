SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.image_url' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
ntrs_mdsdb.u_problem_task_final SRC
join
ntrs_mdwdb.d_problem_task TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
where
TRGT.image_url<>(CONCAT('<a href=\"',
'<<snow_url>>nav_to.do?uri=',
'\/problem_task.do?sys_id=',
SRC.sys_id,
'\" target=\"_blank\" title=\"Check in ServiceNow\"><img src=..\/images\/Numerify\/snow_url_image.png></a>'))
and SRC.cdctype='X') temp;