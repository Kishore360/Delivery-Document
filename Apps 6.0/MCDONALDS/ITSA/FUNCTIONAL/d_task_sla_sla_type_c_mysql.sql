 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_task_sla.sla_type_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM mcd_mdsdb.contract_sla_final src 
JOIN mcd_mdsdb.task_sla_final b ON src.sys_id=b.sla AND src.sourceinstance=b.sourceinstance
LEFT JOIN mcd_mdwdb.d_task_sla trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE COALESCE(src.type,'UNSPECIFIED')<>(trgt.sla_type_c ) and src.cdctype='X'
)temp;

