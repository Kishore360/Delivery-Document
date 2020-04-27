SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.reassignment_count_c' ELSE 'SUCCESS' END as Message FROM (
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
LEFT JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE   SRC.reassignment_count <> TRGT.reassignment_count_c
AND SRC.cdctype='X' ) temp; 
