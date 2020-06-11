select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.task_attribute_wh_old_value_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' 
and 0 <> COALESCE(TGT.task_attribute_wh_old_value_key,'')

union all

select TGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_contact IC
ON  IC.row_id=concat('INTERNAL_CONTACT~',SRC.oldvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'assigned_to' 
and COALESCE(IC.row_key, case when SRC.oldvalue is null then 0 else -1 end) <> COALESCE(TGT.task_attribute_wh_old_value_key,'')

union all

select TGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_organization IO
ON  IO.row_id=concat('GROUP~',SRC.oldvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'assignment_group' 
and COALESCE(IO.row_key, case when SRC.oldvalue is null then 0 else -1 end) <> COALESCE(TGT.task_attribute_wh_old_value_key,'')

union all

select TGT.row_id
from #MDS_TABLE_SCHEMA.sys_audit_final SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov ST
ON  ST.row_id=concat('STATE','~','INCIDENT','~',SRC.oldvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'state' 
and COALESCE(ST.row_key, case when SRC.oldvalue is null then 0 else -1 end) <> COALESCE(TGT.task_attribute_wh_old_value_key,'')
) SQ;