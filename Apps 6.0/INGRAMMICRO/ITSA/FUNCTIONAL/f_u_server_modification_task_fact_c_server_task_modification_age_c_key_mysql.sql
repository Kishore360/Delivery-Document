SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for 
f_u_server_modification_task_fact_c.server_task_modification_age_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT
FROM ingrammicro_mdsdb.u_server_modification_task_final SRC 
JOIN ingrammicro_mdwdb.f_u_server_modification_task_fact_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_u_server_modification_task_c d on d.row_key=TRGT.u_server_modification_task_c_key
JOIN ingrammicro_mdwdb.d_lov_map map on map.src_key=TRGT.task_state_key
WHERE coalesce((select x.row_key from  ingrammicro_mdwdb.d_lov x  where (x.dimension_class = 'AGEBUCKET~SERVER_TASK_MODIFICATION') 
            AND floor( d.age)  between x.lower_range_value and x.upper_range_value),
        -1)<>TRGT.server_task_modification_age_c_key and map.dimension_wh_code in ('RESOLVED','CLOSED')) temp;