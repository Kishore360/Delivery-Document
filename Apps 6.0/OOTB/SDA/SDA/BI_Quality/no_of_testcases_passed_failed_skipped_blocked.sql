
select 
F.test_suite_key, 
case when sum(F.executed_tc) = 0 then '' else cast(sum(F.executed_tc) as varchar(50)) end  as executed_tc,
case when sum(F.passes_tc) = 0 then '' else cast(sum(F.passes_tc) as varchar(50)) end  as passes_tc,
case when sum(F.failed_tc) = 0 then '' else cast(sum(F.failed_tc) as varchar(50)) end  as failed_tc,
case when sum(F.blocked_tc) = 0 then '' else cast(sum(F.blocked_tc) as varchar(50)) end  as blocked_tc,
case when sum(F.skipped_tc) = 0 then '' else cast(sum(F.skipped_tc) as varchar(50)) end  as skipped_tc
from #DWH_TABLE_SCHEMA.test_execution_cube_base F
group by F.test_suite_key
order by F.test_suite_key
