select  F.Application_Module,
F.last_iteration,
case when sum(F.created_tc) = 0 then '' else cast(sum(F.created_tc) as varchar(50)) end  as created_tc,
case when sum(F.executed_tc) = 0 then '' else cast(sum(F.executed_tc) as varchar(50)) end  as executed_tc,
case when sum(F.not_executed_tc) = 0 then '' else cast(sum(F.not_executed_tc) as varchar(50)) end  as not_executed_tc
from #DWH_TABLE_SCHEMA.test_case_icube_base F
group by F.Application_Module,F.last_iteration_key, F.last_iteration
order by lower(F.Application_Module),F.last_iteration_key, F.last_iteration