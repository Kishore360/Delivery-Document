-- Issue in data where sys_id = bf3ee3c90f39ee00daa4cfdce1050ea5 --

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.reassignment_count_numerify' ELSE 'SUCCESS' END as Message

-- select SRC.sys_id, TRGT.reassignment_count_numerify tg, coalesce(reasgn.reassignment_count,0) sr
from #MDS_TABLE_SCHEMA.incident_final SRC
left join #DWH_TABLE_SCHEMA.d_incident TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join (
select base.incident_key, base.source_id, 
count(case when coalesce(INC.last_resolved_on,'9999-01-01 00:00:00') >= base.created_on and base.task_attribute_wh_old_value_key <> 0 then 
case when base.task_attribute_wh_new_value_key <> 0 and base.task_attribute_wh_old_value_key <> base.task_attribute_wh_new_value_key then base.row_id 
when base.task_attribute_wh_new_value_key = 0 and base.task_attribute_wh_next_value_key <> 0 then base.row_id 
else null end
else null end) as reassignment_count
from #DWH_TABLE_SCHEMA.f_incident_activity base
left join #DWH_TABLE_SCHEMA.d_incident INC
on base.incident_key=INC.row_key and base.source_id=INC.source_id
where base.task_wh_type = 'incident' and base.task_attribute_wh_name = 'assignment_group' and base.primary_sequence_id <> 0
group by base.incident_key, base.source_id 
) reasgn
on reasgn.incident_key = TRGT.row_key and reasgn.source_id = TRGT.source_id
where coalesce(TRGT.reassignment_count_numerify,'')<>coalesce(reasgn.reassignment_count,0);