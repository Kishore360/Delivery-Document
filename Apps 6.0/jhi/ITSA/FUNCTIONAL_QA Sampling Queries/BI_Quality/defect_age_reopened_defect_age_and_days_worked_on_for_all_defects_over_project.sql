select 
F.project,
F.defect_id,
case when sum(F.age_since_creation/86400.00) < 0 then 
'('||trim(to_char(round(coalesce((sum(F.age_since_creation * (-1))/86400.00),0.0),1), '9,999,999,990D9'))||')' else 
trim(to_char(round(coalesce((sum(F.age_since_creation/86400.00)),0.0),1), '9,999,999,990D9')) end as defect_age_days,

case when (sum(F.reopened_defect_age)/86400.00) < 0 
then '('||trim(to_char(round(coalesce((sum(F.reopened_defect_age * (-1))/86400.00),0.0),1), '9,999,999,990D9'))||')' else 
trim(to_char(round(coalesce((sum(F.reopened_defect_age/86400.00)),0.0),1), '9,999,999,990D9')) end as reopened_defect_age,

case when sum(F.time_worked_on/86400.00) < 0 then
'('||trim(to_char(round(coalesce((sum(F.time_worked_on * (-1)/86400.00)),0.0),1), '9,999,999,990D9')) ||')'  else 
trim(to_char(round(coalesce((sum(F.time_worked_on/86400.00)),0.0),1), '9,999,999,990D9')) end as time_worked_on

from #DWH_TABLE_SCHEMA.defect_icube_base F
group by  F.project,F.defect_id
order by  lower(F.project),F.defect_id