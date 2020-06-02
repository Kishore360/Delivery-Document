select 
TO_CHAR(F.n_date,'fmMon YYYY') as n_date,
F.project,
concat(trim(to_char(coalesce(round((sum(F.fixed_defect)* 1.00/sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'') as fixing_ratio,
case when sum(F.fixed_defect) = 0 then concat(trim(to_char(coalesce(0.00 ,0.00), '9,999,999,990D99')),'') else
concat(trim(to_char(coalesce(round((sum(F.reopened_defect)* 1.00/sum(F.fixed_defect)),2),0.00), '9,999,999,990D99')),'') end as reopened_ratio,
concat(trim(to_char(coalesce(round((sum(F.regression_defect) * 1.00/sum(F.total_defect)),3),0.00), '9,999,999,990D99')),'') as regression_ratio,
case when sum(F.valid_defect) = 0 then concat(trim(to_char(coalesce(0.00 ,0.00), '9,999,999,990D99')),'%')
else concat(trim(to_char(coalesce(round((sum(F.fixed_defect) * 100.00 /sum(F.valid_defect)),2),0.00), '9,999,999,990D99')),'%') end as defect_gap
from #DWH_TABLE_SCHEMA.work_item_monthly_snapshot_cube F
group by F.n_date,F.project
order by F.n_date,lower(F.project)