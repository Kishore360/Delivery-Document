
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.u_server_ci_c_key' ELSE 'SUCCESS' END as Message
FROM (
Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_configuration_item LKP ON LKP.row_id=
COALESCE(SRC.u_server_ci,'UNSPECIFIED') and SRC.sourceinstance=LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_server_ci is NULL THEN 0 ELSE -1 END)<>TRGT.u_server_ci_c_key) temp;
