SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_server_modification_task_c.met_sla_c_flag' ELSE 'SUCCESS' END as Message FROM (
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_u_server_modification_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE  case when SRC.made_sla=1 then 'Y' else 'N' end  <> TRGT.met_sla_c_flag
AND SRC.cdctype='X' ) temp; 