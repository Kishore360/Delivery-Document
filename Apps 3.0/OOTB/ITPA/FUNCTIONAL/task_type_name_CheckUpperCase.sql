select case when count(1) <> 0 then 'FAILURE' ELSE 'SUCCESS' end AS Result,
case when count(1) <> 0 then 'task_type is not in UPPER case' else 'Success' end as Message
from <<tenant>>_mdwdb.f_task_sla
where crc32(upper(task_type)) <> crc32(task_type);
