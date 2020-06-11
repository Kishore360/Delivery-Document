select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.assigned_to_created_on' else 'SUCCESS' end as Message
from 
(
select TGT.row_id, COALESCE(TGT.created_on,''), COALESCE(TGT.assigned_to_created_on,'')
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
where TGT.task_attribute_wh_name = 'assigned_to' and TGT.incident_key <> -1
and COALESCE(TGT.created_on, '') <> COALESCE(TGT.assigned_to_created_on,'')
union all
select TGT.row_id, 
COALESCE(base.max_assigned_to_created_on,'') sr, COALESCE(TGT.assigned_to_created_on,'') tg
from 
(
select TGT.row_id, TGT.incident_key, TGT.source_id, TGT.primary_sequence_id, max(SQ.created_on) max_assigned_to_created_on
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join (
select TGT.row_id, TGT.incident_key, TGT.source_id, TGT.task_attribute_wh_new_value_key, TGT.created_on
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
where TGT.task_attribute_wh_name = 'assigned_to'
) SQ
on TGT.incident_key = SQ.incident_key and TGT.source_id = SQ.source_id and TGT.created_on >= SQ.created_on and TGT.task_attribute_wh_name = 'state'
where TGT.task_attribute_wh_name = 'state'
group by TGT.row_id, TGT.incident_key, TGT.source_id, TGT.primary_sequence_id
) base 
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on base.row_id = TGT.row_id and base.source_id = TGT.source_id
where TGT.task_attribute_wh_name = 'state' and TGT.incident_key <> -1
and COALESCE(base.max_assigned_to_created_on,'') <> COALESCE(TGT.assigned_to_created_on,'')
union all
select TGT.row_id, 
COALESCE(base.max_assigned_to_created_on,'') sr, COALESCE(TGT.assigned_to_created_on,'') tg
from 
(
select TGT.row_id, TGT.incident_key, TGT.source_id, TGT.primary_sequence_id, max(SQ.created_on) max_assigned_to_created_on
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join (
select TGT.row_id, TGT.incident_key, TGT.source_id, TGT.task_attribute_wh_new_value_key, TGT.created_on
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
where TGT.task_attribute_wh_name = 'assigned_to'
) SQ
on TGT.incident_key = SQ.incident_key and TGT.source_id = SQ.source_id and TGT.created_on >= SQ.created_on and TGT.task_attribute_wh_name = 'assignment_group'
where TGT.task_attribute_wh_name = 'assignment_group'
group by TGT.row_id, TGT.incident_key, TGT.source_id, TGT.primary_sequence_id
) base 
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on base.row_id = TGT.row_id and base.source_id = TGT.source_id
where TGT.task_attribute_wh_name = 'assignment_group' and TGT.incident_key <> -1
and COALESCE(base.max_assigned_to_created_on,'') <> COALESCE(TGT.assigned_to_created_on,'')
) SQ;