select  TO_CHAR(F.n_date,'fmMon YYYY') as n_date,
F.defect_id,
F.assigned_to,
F.last_iteration,
F.detected_on_date,
F.resolved_dt,
F.business_priority,
F.severity,
F.src_status,
F.resolved_reason,
F.short_description,
trim(to_char(coalesce(round((sum(F.age_since_creation/86400.00)),1),0.0), '9,999,999,990D9')) as defect_age
from #DWH_TABLE_SCHEMA.work_item_monthly_snapshot_cube F
group by F.n_date,F.defect_id,F.assigned_to,F.ite_key,F.last_iteration,F.detected_on_date,F.resolved_dt,F.business_priority,F.severity,
F.src_status,F.resolved_reason,F.short_description
order by F.n_date,F.defect_id,F.assigned_to,F.ite_key,F.last_iteration,F.detected_on_date,F.resolved_dt,F.business_priority,F.severity,
F.src_status,F.resolved_reason,F.short_description
