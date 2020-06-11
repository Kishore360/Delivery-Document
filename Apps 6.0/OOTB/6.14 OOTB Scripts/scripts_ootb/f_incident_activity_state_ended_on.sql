SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_activity.state_ended_on' ELSE 'SUCCESS' END as Message
FROM 
(
select base.row_id, coalesce(adddate(base.state_created_on, INTERVAL base.primary_duration SECOND),'') sr, coalesce(base.state_ended_on,'') tg
from #DWH_TABLE_SCHEMA.f_incident_activity base 
where base.task_attribute_wh_name in ('state', 'assigned_to', 'assignment_group') and base.incident_key <> -1 and 
coalesce(adddate(base.state_created_on, INTERVAL base.primary_duration SECOND),'') <> coalesce(base.state_ended_on,'')
) SQ;