select 
F.project,
F.wi_severity,
trim(to_char(coalesce(round((count(distinct case when F.task_attribute_wh_next_value_key <> 0 then F.row_key else null end))* 
(1.00)/count(distinct F.work_item_key), 0),0), '999,999,990')) avg_state_chang_count,
case when (sum(F.primary_duration)/86400.00) < 0 
then '-'||trim(to_char(coalesce(round((sum(F.primary_duration * (-1))/86400.00)/count(distinct F.work_item_key),1),0), '999,999,990.9'))
else trim(to_char(coalesce(round((sum(F.primary_duration)/86400.00)/count(distinct F.work_item_key),1),0), '999,999,990.9')) end avg_state_dur
from  #DWH_TABLE_SCHEMA.defect_state_change_icube_base F
group by F.project,F.wi_severity
order by lower(F.project),F.wi_severity