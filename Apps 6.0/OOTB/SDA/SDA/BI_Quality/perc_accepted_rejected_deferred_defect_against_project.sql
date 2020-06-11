select F.project,
case when sum(F.total_defect) = 0 then '' else cast(sum(F.total_defect) as varchar(50)) end  as total_defects,
case when sum(F.valid_defect) = 0 then '' else cast(sum(F.valid_defect) as varchar(50)) end  as accepted_defects,
case when sum(F.invalid_defect) = 0 then '' else cast(sum(F.invalid_defect) as varchar(50)) end  as rejected_defects,
case when sum(F.deferred_defect) = 0 then '' else cast(sum(F.deferred_defect) as varchar(50)) end  as deferred_defect,
concat(trim(to_char(coalesce(round((sum(F.valid_defect) * 100.00 /sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'%') as prct_acpt_defects,
concat(trim(to_char(coalesce(round((sum(F.invalid_defect) * 100.00 /sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'%') as prct_rejected_defects,
concat(trim(to_char(coalesce(round((sum(F.deferred_defect) * 100.00 /sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'%') as prct_deff_defects
from #DWH_TABLE_SCHEMA.defect_icube_base F
group by F.project
order by lower(F.project)