select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_task_activity.updated_by' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_change_task_activity TGT
left join #DWH_TABLE_SCHEMA.f_change_task F 
on F.change_task_key = TGT.change_task_key
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id and SRC.sourceinstance=F.source_id
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N'
and COALESCE(F.changed_by, '') <> COALESCE(TGT.updated_by,'')
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(SRC.user, '') <> COALESCE(TGT.updated_by,'') 
) SQ;