SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.closed_by_key' ELSE 'SUCCESS' END as Message FROM (
Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_internal_contact LKP ON LKP.row_id=
COALESCE(concat('INTERNAL_CONTACT~',SRC.opened_by),'UNSPECIFIED') and SRC.sourceinstance=LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by is NULL THEN 0 ELSE -1 END)<>TRGT.opened_by_key) temp;


