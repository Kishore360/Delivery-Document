


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for sc_req_item_final_module_last_resolved_on_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM tjx_mdsdb.task_final a 
JOIN tjx_mdsdb.sc_req_item_final c ON a.sys_id=c.sys_id and a.sourceinstance=c.sourceinstance
JOIN tjx_mdwdb.d_task d ON a.sys_id=d.row_id and a.sourceinstance=d.source_id
WHERE CONVERT_TZ(c.u_fulfilled_at,'GMT','America/New_York')<>d.last_resolved_on_c
)temp;
