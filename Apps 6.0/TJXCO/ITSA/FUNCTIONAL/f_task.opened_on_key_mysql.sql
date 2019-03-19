SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM tjxco_mdsdb.task_sla_final src
join tjxco_mdsdb.task_final a on src.task=a.sys_id and src.sourceinstance=a.sourceinstance
JOIN tjxco_mdwdb.f_task b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
JOIN tjxco_mdwdb.d_calendar_date LKP 
ON COALESCE(DATE_FORMAT(CONVERT_TZ(a.opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')=LKP.row_id 
WHERE (LKP.row_key)<>(b.opened_on_key)
)temp;



