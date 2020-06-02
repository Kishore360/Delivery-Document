select F.test_suite_key
,F.wi_testcase
,TE_created_by
,F.TE_number
,F.TE_name
,TE_executed_by
,TE_started_on
,TE_ended_on
,F.tc_status
,trim(to_char(coalesce(round((F.duration),0),0), '9,999,999,990')) as duration
 from #DWH_TABLE_SCHEMA..test_execution_cube_base F
group by F.test_suite_key,F.wi_testcase,TE_created_by,F.TE_name,F.TE_number,TE_executed_by,TE_ended_on,TE_started_on,F.tc_status,F.duration
order by F.test_suite_key,F.wi_testcase,TE_created_by,F.TE_name,F.TE_number,TE_executed_by,TE_ended_on,TE_started_on,F.tc_status,F.duration
