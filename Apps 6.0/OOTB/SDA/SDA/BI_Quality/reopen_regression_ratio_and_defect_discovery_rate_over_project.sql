select F.project,
case when sum(F.fixed_defect) = 0 then concat(trim(to_char(coalesce(0.00 ,0.00), '9,999,999,990D99')),'')
else concat(trim(to_char(coalesce(round((sum(F.reopened_defect) * 1.00/sum(F.fixed_defect)),2),0.00), '9,999,999,990D99')),'') end as reopen_ratio,
concat(trim(to_char(coalesce(round((sum(F.regression_defect) * 1.00/sum(F.total_defect)),2),0.00), '9,999,999,990D99')),'') as regression_ratio,
case when sum(F.tot_tc_executed) = 0 then concat(trim(to_char(coalesce(0.00 ,0.00), '9,999,999,990D99')),'')
else concat(trim(to_char(coalesce(round((sum(F.valid_defect) * 1.00/sum(F.tot_tc_executed)),2),0.00), '9,999,999,990D99')),'') end as defect_discovery_rate
from #DWH_TABLE_SCHEMA.defect_icube_base F
group by F.project
order by lower(F.project)