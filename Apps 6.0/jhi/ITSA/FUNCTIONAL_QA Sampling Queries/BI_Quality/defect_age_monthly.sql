select TO_CHAR(F.n_date,'fmMon YYYY') as n_date,
F.defect_id,
trim(to_char(coalesce(round((sum(F.age_since_creation/86400.00)),1),0), '9,999,999,9990D9')) as defect_age
from #DWH_TABLE_SCHEMA.work_item_monthly_snapshot_cube F
group by F.n_date,F.work_item_key,F.defect_id
order by F.n_date,F.defect_id