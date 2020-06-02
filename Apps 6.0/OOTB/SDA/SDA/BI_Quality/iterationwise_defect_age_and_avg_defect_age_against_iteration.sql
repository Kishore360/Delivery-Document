select
F.project,F.fixed_iteration,
concat(trim(to_char(coalesce(round((avg(F.age_since_creation/86400.00)),1),0.0), '9,999,999,990D9')),'') as average_defect_age,
case when sum(F.closed_defect) = 0 then concat(trim(to_char(coalesce(0.00 ,0.00), '9,999,999,990D9')),'')
else concat(trim(to_char(coalesce(round(( sum(F.close_age_since_creation/86400.00)/sum(F.closed_defect)),2),0.00), '9,999,999,990D9')),'') end as Iterationwise_defectage
from #DWH_TABLE_SCHEMA.defect_icube_base F
group by F.project_key, F.project,F.fix_ite_key,F.fixed_iteration
order by lower(F.project),F.fix_ite_key,F.fixed_iteration
