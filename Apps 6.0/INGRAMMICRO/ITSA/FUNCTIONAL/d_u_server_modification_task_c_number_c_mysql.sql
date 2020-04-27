SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_server_modification_task_c.backlog_flag_c' ELSE 'SUCCESS' END as Message FROM 
(
SELECT  count(1) as CNT
fROM  ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.d_u_server_modification_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)

WHERE   number  <> TRGT.number_c
AND SRC.cdctype='X' ) temp; 


