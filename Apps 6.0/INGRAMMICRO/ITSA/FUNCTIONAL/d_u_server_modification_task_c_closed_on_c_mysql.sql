-- START
#d_u_server_modification_task_c.last_resolved_on_c
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_u_server_modification_task_c.last_resolved_on_c' ELSE 'SUCCESS' END as Message
FROM (Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.d_u_server_modification_task_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE
CONVERT_TZ( CASE 
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        ingrammicro_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'SERVER_MODIFICATION_TASK_C~STATE' 
                        AND d_lov_map.dimension_code = SRC.state 
                        AND d_lov_map.source_id = SRC.sourceinstance),
                    'UNKNOWN') = 'OPEN' then NULL 
                    when COALESCE((SELECT
                        dimension_wh_code 
                    FROM
                        ingrammicro_mdwdb.d_lov_map 
                    WHERE
                        d_lov_map.dimension_class = 'SERVER_MODIFICATION_TASK_C~STATE' 
                        AND d_lov_map.dimension_code = SRC.state 
                        AND d_lov_map.source_id = SRC.sourceinstance),
                    'UNKNOWN') in ('CLOSED',
                    'RESOLVED' ) then  coalesce(SRC.closed_at,
                    SRC.sys_updated_on ) 
                end ,
                'GMT',
                'America/Los_Angeles')
<>TRGT.closed_on_c) temp;
-- END