

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_sla.schedule_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
FROM nbcu_mdsdb.contract_sla_final src 
LEFT JOIN nbcu_mdsdb.cmn_schedule_final src1 ON src.schedule=src1.sys_id and src.sourceinstance=src1.sourceinstance
LEFT JOIN nbcu_mdwdb.d_task_sla trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE COALESCE(src1.name,'UNSPECIFIED')<>(trgt.schedule_c)
)temp;
