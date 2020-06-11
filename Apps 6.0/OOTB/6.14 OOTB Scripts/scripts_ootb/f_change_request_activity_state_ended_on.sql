SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request_activity.state_ended_on' ELSE 'SUCCESS' END as Message
FROM 
(
select base.row_id, base.state_ended_on
from #DWH_TABLE_SCHEMA.f_change_request_activity base 
join #DWH_TABLE_SCHEMA.f_change_request_activity next
on base.change_request_key = next.change_request_key and base.primary_sequence_id+1 = next.primary_sequence_id and base.task_attribute_wh_name = next.task_attribute_wh_name
where base.task_attribute_wh_name = 'state' and
coalesce(null,'') <> coalesce(base.state_ended_on,'')
-- coalesce(base.state_ended_on,'') <> coalesce(next.state_created_on,'')
union all
select base.row_id, base.state_ended_on
from #DWH_TABLE_SCHEMA.f_change_request_activity base 
join
(
select max(F.primary_sequence_id) max_sequence_id, change_request_key, task_attribute_wh_name
from #DWH_TABLE_SCHEMA.f_change_request_activity F
group by change_request_key, task_attribute_wh_name
)max_id
on base.change_request_key = max_id.change_request_key and max_id.max_sequence_id = base.primary_sequence_id and base.task_attribute_wh_name = max_id.task_attribute_wh_name
LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness
group by source_id
 ) FRESH ON (FRESH.source_id=base.source_id)
where base.task_attribute_wh_name = 'state' and
coalesce(null,'') <> coalesce(base.state_ended_on,'')
-- coalesce(base.state_ended_on,'') <> coalesce(FRESH.lastupdated,'')
) SQ