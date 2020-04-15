SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.age' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_u_server_modification_task_c d on d.row_key=TRGT.u_server_modification_task_c_key
JOIN ingrammicro_mdwdb.d_lov_map map on map.src_key=TRGT.task_state_key
WHERE if(timestampdiff(SECOND, CONVERT_TZ(d.opened_on_c, 'America/Los_Angeles','GMT'),CONVERT_TZ(coalesce(d.last_resolved_on_c, d.closed_on_c),
        'America/Los_Angeles','GMT'))>0, timestampdiff(SECOND,CONVERT_TZ(d.opened_on_c,'America/Los_Angeles', 'GMT'),
        CONVERT_TZ(coalesce(d.last_resolved_on_c,d.closed_on_c), 'America/Los_Angeles','GMT')), 0)<>TRGT.age
and map.dimension_wh_code in ('RESOLVED','CLOSED')) temp;