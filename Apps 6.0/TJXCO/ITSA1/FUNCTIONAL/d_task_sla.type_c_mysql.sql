SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_sla.type_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT 
FROM tjxco_mdsdb.task_sla_final src1
left join tjxco_mdsdb.contract_sla_final src on src1.sla=src.sys_id and src1.sourceinstance=src.sourceinstance
LEFT JOIN tjxco_mdwdb.d_task_sla trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE COALESCE(src.type,'UNSPECIFIED') <> (trgt.type_c)
)temp;
