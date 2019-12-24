SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_task_sla.active_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.contract_sla_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_task_sla TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  IF(SRC.active=TRUE,'Y','N')  <> TRGT.active_flag
AND SRC.cdctype='X' ) temp;