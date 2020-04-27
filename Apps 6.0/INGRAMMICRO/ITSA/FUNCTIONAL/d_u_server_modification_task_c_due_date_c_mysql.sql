

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.opened_on_key' ELSE 'SUCCESS' END as Message
FROM (
Select count(1) as CNT
FROM  ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN   ingrammicro_mdwdb.d_u_server_modification_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 
WHERE CONVERT_TZ(SRC.due_date,'GMT', 'America/Los_Angeles')<>TRGT.due_date_c) temp;

