select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'linked_to_task_flag validation failed for d_outage' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_outage d
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') t
on t.sys_id=d.row_id
where d.ROW_key not in (0,-1) 
and t.sys_id not in (0,-1)
and COALESCE(case when t.sys_id is not null then 'Y'
else 'N' end, '')  <> 
d.LINKED_TO_TASK_FLAG ;