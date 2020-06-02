SELECT 
    CASE
        WHEN CNT > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END as Result,
    CASE
        WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag'
        ELSE 'SUCCESS'
    END as Message
	FROM (SELECT count(1) as CNT
from
    #MDS_TABLE_SCHEMA.task_sla_final task_sla
        left join
    #DWH_TABLE_SCHEMA.d_task_sla d ON task_sla.sla = d.row_id
        and task_sla.sourceinstance = d.source_id
        join
    #DWH_TABLE_SCHEMA.f_task_sla a ON task_sla.sys_id = a.row_id
        and a.source_id = task_sla.sourceinstance
where
    a.sla_key <> coalesce(d.row_key,case
                when task_sla.sla is null then 0
                else - 1
            end))temp;


			
			