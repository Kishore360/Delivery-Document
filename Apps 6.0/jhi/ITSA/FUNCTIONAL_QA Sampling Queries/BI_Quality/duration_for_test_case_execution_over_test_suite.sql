select F.test_suite_key
,F.wi_testcase
,F.TE_number
,F.TE_name
,trim(to_char(coalesce(round((F.duration),0),0), '9,999,999,990')) duration
from #DWH_TABLE_SCHEMA.test_execution_cube_base F
group by F.test_suite_key,F.wi_testcase,F.TE_number,F.TE_name,F.duration
order by F.test_suite_key,F.wi_testcase,F.TE_number,F.TE_name,F.duration
