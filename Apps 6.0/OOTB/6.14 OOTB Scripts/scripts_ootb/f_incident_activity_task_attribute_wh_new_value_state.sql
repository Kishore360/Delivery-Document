select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.task_attribute_wh_new_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join #DWH_TABLE_SCHEMA.d_incident D
on D.row_key = TGT.incident_key
left join #DWH_TABLE_SCHEMA.f_incident F 
on F.row_id = D.row_id
and TGT.task_attribute_wh_name = 'state' and TGT.primary_sequence_id = 0 
and F.soft_deleted_flag = 'N'
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT2
on (F.incident_key=TGT2.incident_key and TGT2.primary_sequence_id = 1 and TGT2.task_attribute_wh_name = 'state')
where
 TGT.primary_sequence_id = 0  and D.soft_deleted_flag = 'N'
 and TGT.task_attribute_wh_name = 'state'
 and COALESCE(null,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
 -- and COALESCE(coalesce(TGT2.task_attribute_wh_old_value, F.state_src_code),'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 
and COALESCE(SRC.newvalue,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
) SQ