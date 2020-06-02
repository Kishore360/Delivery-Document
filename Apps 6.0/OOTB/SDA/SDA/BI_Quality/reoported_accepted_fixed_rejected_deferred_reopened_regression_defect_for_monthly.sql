select
TO_CHAR(F.n_date,'fmMon YYYY') as n_date,
case when sum(F.total_defect) = 0 then '' else cast(sum(F.total_defect) as varchar(50)) end  as total_defects,
case when sum(F.valid_defect) = 0 then '' else cast(sum(F.valid_defect) as varchar(50)) end  as accepted_defects,
case when sum(F.fixed_defect) = 0 then '' else cast(sum(F.fixed_defect) as varchar(50)) end  as fixed_defects,
case when sum(F.invalid_defect) = 0 then '' else cast(sum(F.invalid_defect) as varchar(50)) end  as rejected_defects,
case when sum(F.deferred_defect) = 0 then '' else cast(sum(F.deferred_defect) as varchar(50)) end  as deferred_defects,
case when sum(F.reopened_defect) = 0 then '' else cast(sum(F.reopened_defect) as varchar(50)) end  as reopened_defects,
case when sum(F.regression_defect) = 0 then '' else cast(sum(F.regression_defect) as varchar(50)) end  as regression_defects
from #DWH_TABLE_SCHEMA.work_item_monthly_snapshot_cube F
group by F.n_date
order by F.n_date

