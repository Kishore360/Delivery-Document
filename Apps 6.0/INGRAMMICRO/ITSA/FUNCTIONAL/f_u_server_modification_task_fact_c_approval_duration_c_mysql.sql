
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.approval_duration_c' ELSE 'SUCCESS' END as Message
FROM (Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(CASE WHEN (SRC.opened_at is null or SRC.approval_set is null) THEN NULL  
 WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.approval_set) < 0 THEN NULL   
 ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.approval_set) end,0)
<>coalesce(TRGT.approval_duration_c,0)) temp;