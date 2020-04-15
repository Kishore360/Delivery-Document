SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.opened_time_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
LEFT JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join ingrammicro_mdwdb.d_calendar_time LKP on LKP.row_id=COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.opened_at,
                'GMT', 'America/Los_Angeles'),'%H%i'),'UNSPECIFIED')
WHERE    COALESCE(LKP.row_key,CASE WHEN SRC.opened_at is NULL THEN 0 ELSE -1 END)  <> TRGT.opened_time_key
AND SRC.cdctype='X' ) temp; 
