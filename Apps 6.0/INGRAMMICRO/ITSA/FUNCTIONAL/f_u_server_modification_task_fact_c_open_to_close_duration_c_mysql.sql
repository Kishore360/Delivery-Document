
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.open_to_close_duration_c' ELSE 'SUCCESS' END as Message FROM (
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
LEFT JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE   CASE WHEN (SRC.opened_at is null or SRC.closed_at is null) THEN NULL 
  WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) < 0 THEN NULL   
  ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) end <> TRGT.open_to_close_duration_c
AND SRC.cdctype='X' ) temp; 
