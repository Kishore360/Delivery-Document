select F.prev_scr_state,
case when max(F.primary_duration) < 0
then '('||trim(to_char(coalesce(round((max(F.primary_duration * (-1))/86400.00),1),0), '999,999,990D0'))||')'
else trim(to_char(coalesce(round((max(F.primary_duration)/86400.00),1),0), '999,999,990D0')) end max_state_dur,
case when min(F.primary_duration) < 0
then '('||trim(to_char(coalesce(round((min(F.primary_duration) * (-1)/86400.00),1),0), '999,999,990D0'))||')'
else trim(to_char(coalesce(round((min(F.primary_duration)/86400.00),1),0), '999,999,990D0')) end min_state_dur
from  #DWH_TABLE_SCHEMA.defect_state_change_icube_base F
group by F.prev_scr_state
order by F.prev_scr_state
