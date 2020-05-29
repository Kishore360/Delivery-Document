select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.task_attribute_wh_new_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join #DWH_TABLE_SCHEMA.f_incident F 
on F.incident_key = TGT.incident_key
and F.soft_deleted_flag = 'N'
left join #MDS_TABLE_SCHEMA.sys_audit_final SRC
on SRC.documentkey = F.row_id
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT2
on (TGT.incident_key=TGT2.incident_key AND TGT.source_id=TGT2.source_id AND TGT.task_attribute_wh_name=TGT2.task_attribute_wh_name and TGT2.primary_sequence_id = 1)
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' and
COALESCE(null,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
-- and COALESCE(TGT2.task_attribute_wh_old_value, F.state_src_code,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union
select TGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(SRC.newvalue,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
) SQ;