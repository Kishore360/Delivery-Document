select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.task_attribute_wh_new_value_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join #DWH_TABLE_SCHEMA.f_incident F 
on F.incident_key = TGT.incident_key
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT2
on (TGT.incident_key=TGT2.incident_key AND TGT.source_id=TGT2.source_id AND TGT.task_attribute_wh_name = TGT2.task_attribute_wh_name and TGT2.primary_sequence_id = 1)
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' and F.soft_deleted_flag = 'N'
and COALESCE(TGT2.task_attribute_wh_old_value_key, 
case when TGT.task_attribute_wh_name = 'state' then F.state_src_key 
when TGT.task_attribute_wh_name = 'assigned_to' then F.assigned_to_key 
when TGT.task_attribute_wh_name = 'assignment_group' then F.assignment_group_key 
else 0 end,0) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')

union all

select TGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_contact IC
ON  IC.row_id=concat('INTERNAL_CONTACT~',SRC.newvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'assigned_to' 
and COALESCE(IC.row_key, case when SRC.newvalue is null then 0 else -1 end) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')

union all

select TGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_organization IO
ON  IO.row_id=concat('GROUP~',SRC.newvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'assignment_group' 
and COALESCE(IO.row_key, case when SRC.newvalue is null then 0 else -1 end) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')

union all

select TGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov ST
ON  ST.row_id=concat('STATE','~','INCIDENT','~',SRC.newvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'state' 
and COALESCE(ST.row_key, case when SRC.newvalue is null then 0 else -1 end) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
) SQ;