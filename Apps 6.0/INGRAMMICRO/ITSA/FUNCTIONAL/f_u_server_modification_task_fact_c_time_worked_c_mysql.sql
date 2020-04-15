SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.time_worked_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
LEFT JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(CASE WHEN SRC.time_worked is null  THEN NULL  
 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.time_worked) < 0 THEN NULL   
 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.time_worked) end,0)
<>coalesce(TRGT.time_worked_c,0)
AND SRC.cdctype='X' ) temp; 
