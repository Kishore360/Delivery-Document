select 
TO_CHAR(F.n_date,'fmMon YYYY') as n_date,
F.project,
sum(F.total_defect) as total_defects,
case when sum(F.valid_defect) = 0 then '' else cast(sum(F.valid_defect) as varchar(50)) end  as accepted_defects,
case when sum(F.invalid_defect) = 0 then '' else cast(sum(F.invalid_defect) as varchar(50)) end  as rejected_defects,
case when sum(F.deferred_defect) = 0 then '' else cast(sum(F.deferred_defect) as varchar(50)) end  as deferred_defects,
concat(trim(to_char(coalesce(round((sum(F.valid_defect) * 100.00 /sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'%') as prct_acpt_defects,
concat(trim(to_char(coalesce(round((sum(F.invalid_defect) * 100.00 /sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'%') as prct_rejected_defects,
concat(trim(to_char(coalesce(round((sum(F.deferred_defect) * 100.00 /sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'%') as prct_deff_defects
from #DWH_TABLE_SCHEMA.work_item_monthly_snapshot_cube F
group by F.n_date,F.project
order by F.n_date,lower(F.project)