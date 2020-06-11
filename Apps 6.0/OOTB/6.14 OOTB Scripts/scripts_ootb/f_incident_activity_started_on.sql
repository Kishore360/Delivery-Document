SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_activity.started_on' ELSE 'SUCCESS' END as Message
FROM 
(
select base.row_id, base.started_on
from #DWH_TABLE_SCHEMA.f_incident_activity base 
where base.task_attribute_wh_name in ('state', 'assigned_to', 'assignment_group') 
and base.incident_key <> -1 and
coalesce(greatest(base.assigned_to_created_on,base.group_created_on,base.state_created_on),'') <> coalesce(base.started_on, '')
) SQ;