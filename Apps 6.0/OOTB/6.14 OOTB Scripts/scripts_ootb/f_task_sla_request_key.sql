select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for request_key from task_sla_final to f_task_sla' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_sla_final WHERE CDCTYPE<>'D') S

left join ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') task ON S.task = task.sys_id and S.sourceinstance = task.sourceinstance

left join #DWH_TABLE_SCHEMA.d_request REQ on REQ.row_id = COALESCE(S.task,'UNSPECIFIED') and REQ.source_id = S.sourceinstance and upper(task.sys_class_name)  ='REQUEST'

left join #DWH_TABLE_SCHEMA.f_task_sla DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where 
ifnull(case when (S.task is null) or upper(task.sys_class_name) is null then 0
when S.task is not null and upper(task.sys_class_name) <> 'REQUEST' then 0 
when REQ.row_key is null and upper(task.sys_class_name) = 'REQUEST' then -1 else REQ.row_key end,'') <> ifnull(DWH.request_key,'');
