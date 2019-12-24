SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_sla.has_breached_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.task_sla_final SRC 
LEFT JOIN ingrammicro_mdwdb.f_task_sla TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  IF(SRC.has_breached=TRUE,'Y','N')  <> TRGT.has_breached_c_flag
AND SRC.cdctype='X' ) temp; 