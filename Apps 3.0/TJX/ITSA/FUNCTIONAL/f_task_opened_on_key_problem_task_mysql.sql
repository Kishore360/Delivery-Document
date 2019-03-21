select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_c.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM tjx_mdsdb.task_final a 
JOIN tjx_mdwdb.f_task_c b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
JOIN tjx_mdwdb.d_calendar_date LKP 
ON COALESCE(DATE_FORMAT(CONVERT_TZ(a.opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')= LKP.row_id 
WHERE (LKP.row_key) <> (b.opened_on_key)
and b.soft_deleted_flag <>'Y'
and a.sys_class_name='problem_task'
 )temp;