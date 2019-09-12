select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_task_activity.created_time_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from tjx_mdwdb.f_change_task_activity TGT
left join tjx_mdwdb.d_change_task D
on D.row_key = TGT.change_task_key
left join tjx_mdwdb.f_change_task F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join tjx_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
where TGT.primary_sequence_id = 0 and D.soft_deleted_flag = 'N'
and COALESCE(F.opened_time_key,'') <> COALESCE(TGT.created_time_key,'')
union
select TGT.row_id
from tjx_mdsdb.sys_audit_final SRC
left join tjx_mdwdb.f_change_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join tjx_mdwdb.d_calendar_time CAL
on CAL.row_id = date_format(convert_tz(SRC.sys_created_on,'GMT','America/New_York'),'%H%i') and CAL.source_id=0
where TGT.primary_sequence_id <> 0 
and COALESCE(CAL.row_key,'') <> COALESCE(TGT.created_time_key,'')
) SQ;
