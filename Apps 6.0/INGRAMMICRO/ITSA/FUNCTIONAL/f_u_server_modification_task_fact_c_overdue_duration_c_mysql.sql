SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.overdue_duration_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_u_server_modification_task_c d on d.row_key=TRGT.u_server_modification_task_c_key
JOIN ingrammicro_mdwdb.d_lov_map map on map.src_key=TRGT.server_modification_state_c_key
WHERE  case 
            when (d.overdue_flag_c='Y' 
            and  d.closed_on_c > d.due_date_c ) then TIMESTAMPDIFF(SECOND,
            CONVERT_TZ(d.due_date_c,
            'America/Los_Angeles',
            'GMT'),
            CONVERT_TZ( d.closed_on_c,
            'America/Los_Angeles',
            'GMT')) 
            else 0 end
<>TRGT.overdue_duration_c and map.dimension_wh_code in ('RESOLVED','CLOSED')) temp;