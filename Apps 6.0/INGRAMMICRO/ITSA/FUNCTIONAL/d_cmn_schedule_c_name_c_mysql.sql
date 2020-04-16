SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_u_server_modification_task_fact_c.closed_by_key' ELSE 'SUCCESS' END as Message FROM (
Select count(1) as CNT
FROM    ingrammicro_mdsdb.cmn_schedule_final SRC 
JOIN ingrammicro_mdwdb.d_cmn_schedule_c TRGT ON sys_id= TRGT.row_id
where name<>name_c
)b;

