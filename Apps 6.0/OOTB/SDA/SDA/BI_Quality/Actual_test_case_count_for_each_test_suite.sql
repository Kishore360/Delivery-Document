select 
F.TE_number,F.TE_name,max(F.TE_testcase_count) as Actual_tc_count
from #DWH_TABLE_SCHEMA.test_execution_cube_base F 
group by F.TE_number,F.TE_name
order by F.TE_number,F.TE_name