select case when count(1) <> 0 then 'FAILURE' ELSE 'SUCCESS' end AS Result,
case when count(1) <> 0 then 'task_type is not in UPPER case' else 'SUCCESS' end as Message
from #DWH_TABLE_SCHEMA.f_task_sla
where upper(task_type) <> task_type;