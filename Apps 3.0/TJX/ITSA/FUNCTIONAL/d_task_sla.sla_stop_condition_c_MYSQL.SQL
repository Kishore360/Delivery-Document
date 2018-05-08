SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_sla.sla_stop_condition_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjx_mdsdb.contract_sla_final src 
JOIN tjx_mdsdb.task_sla_final b ON src.sys_id=b.sla AND src.sourceinstance=b.sourceinstance
JOIN tjx_mdwdb.d_task_sla trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE COALESCE(SUBSTRING(src.stop_condition,1,255),'UNSPECIFIED')<>(trgt.sla_stop_condition_c)
)temp;

 