
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.due_on_key' ELSE 'SUCCESS' END as Message
FROM (Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where COALESCE(DATE_FORMAT(CONVERT_TZ(SRC
.due_date,           'GMT',
                'America/Los_Angeles'),
                '%Y%m%d'),
                'UNSPECIFIED')
<>TRGT.due_on_key) temp;