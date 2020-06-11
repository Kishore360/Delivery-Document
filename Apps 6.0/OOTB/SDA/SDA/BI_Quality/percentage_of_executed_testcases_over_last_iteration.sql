select  F.last_iteration,
case when sum(F.created_tc) = 0 then '' else cast(sum(F.created_tc) as varchar(50)) end  as created_tc,
case when sum(F.executed_tc) = 0 then '' else cast(sum(F.executed_tc) as varchar(50)) end  as executed_tc,
concat(trim(to_char(coalesce(round((sum(F.executed_tc) * 100.00/sum(F.created_tc)),2),0.00), '9,999,999,990D99')),'%') as test_exec_per
from #DWH_TABLE_SCHEMA.test_case_icube_base F
group by F.last_iteration_key, F.last_iteration
order by F.last_iteration_key, F.last_iteration