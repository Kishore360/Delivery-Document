select 
F.work_item_number defect_id,
case when 
count(CASE WHEN (F.task_attribute_wh_next_value_key <> 0 and
(F.wi_sts = 'PROPOSED' or F.wi_sts = 'IN PROGRESS' or F.lagging_count_of_month between 0 and 12))
THEN F.row_key ELSE NULL END) = 0 then '' else
cast(count(CASE WHEN (F.task_attribute_wh_next_value_key <> 0 and
(F.wi_sts = 'PROPOSED' or F.wi_sts = 'IN PROGRESS' or F.lagging_count_of_month between 0 and 12))
THEN F.row_key ELSE NULL END) as varchar(50) ) end AS state_chang_count,

case when (sum(F.primary_duration)/86400.00) < 0 
then '('||trim(to_char(coalesce(round((sum(F.primary_duration * (-1))/86400.00),1),0), '999,999,990.0'))||')'
else trim(to_char(coalesce(round((sum(F.primary_duration)/86400.00),1),0), '999,999,990.0')) end state_dur

from  #DWH_TABLE_SCHEMA.defect_state_change_icube_base F
group by F.work_item_number
order by F.work_item_number