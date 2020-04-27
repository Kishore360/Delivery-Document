

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.opened_on_key' ELSE 'SUCCESS' END as Message
FROM (
Select count(1) as CNT
FROM   ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN   ingrammicro_mdwdb.d_u_server_modification_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 
WHERE case when active=1 then 'Y' else 'N' end <>TRGT.active_flag_c) temp;


