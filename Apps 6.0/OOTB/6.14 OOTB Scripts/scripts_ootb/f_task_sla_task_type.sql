select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for task_type of task_sla_final to f_task_sla' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_sla_final WHERE CDCTYPE<>'D') S

left join ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') task ON S.task = task.sys_id 

left join #DWH_TABLE_SCHEMA.f_task_sla DWH on S.sys_id = DWH.row_id and S.sourceinstance = DWH.source_id

where ifnull(upper(task.sys_class_name),'') <> ifnull(DWH.task_type,'');
