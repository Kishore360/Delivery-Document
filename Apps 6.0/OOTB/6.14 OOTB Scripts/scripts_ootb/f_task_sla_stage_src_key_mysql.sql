SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT 
from 
#MDS_TABLE_SCHEMA.task_sla_final task_sla 
left join #DWH_TABLE_SCHEMA.d_lov d on d.row_id = CONCAT('STAGE','~','TASK_SLA','~',UPPER(task_sla.stage ))
join #DWH_TABLE_SCHEMA.f_task_sla a on a.row_id=task_sla.sys_id and a.source_id=task_sla.sourceinstance
where 
a.stage_src_key<>coalesce(d.row_key,case when task_sla.stage is null then 0 else -1 end))temp;

