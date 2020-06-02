select 
TO_CHAR(F.n_date,'fmMon DD') as n_date,
F.project,
F.last_iteration,
concat(trim(to_char(coalesce(round((avg(F.age_since_creation/86400.00)),1),0.0), '9,999,999,990D9')),'') as average_defect_age
from #DWH_TABLE_SCHEMA.work_item_weekly_snapshot_cube F
group by F.n_date, F.project,F.ite_key, F.last_iteration
order by F.n_date,lower(F.project),F.ite_key,F.last_iteration