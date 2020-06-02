select 	dp.name,d.build_number,trim(to_char(coalesce(round((sum(f.AUTOMATED_TEST_TOTAL_COUNT)),0),0), '9,999,999,990')) as test_total,
trim(to_char(coalesce(round((sum(f.AUTOMATED_TEST_PASS_COUNT)),0),0), '9,999,999,990')) as  test_pass,
trim(to_char(coalesce(round((sum(f.AUTOMATED_TEST_FAIL_COUNT)),0),0), '9,999,999,990')) as test_fail,
trim(to_char(coalesce(round((sum(f.AUTOMATED_TEST_SKIP_COUNT)),0),0), '9,999,999,990')) as test_skip
from #DWH_TABLE_SCHEMA.f_build_run f
    join #DWH_TABLE_SCHEMA.d_build_run d
           on f.build_run_key=d.row_key
    
     join #DWH_TABLE_SCHEMA.d_build_project dp
	        on f.build_project_key=dp.row_key
    join #DWH_TABLE_SCHEMA.d_build_run dp_completed
	       on dp.last_completed_build_run_key=dp_completed.row_key 
    join #DWH_TABLE_SCHEMA.d_build_run dp_successful
	       on dp.last_successful_build_run_key=dp_successful.row_key
     join #DWH_TABLE_SCHEMA.d_build_run dp_unsuccessful
	       on dp.last_unsuccessful_build_run_key=dp_unsuccessful.row_key
    join #DWH_TABLE_SCHEMA.d_build_run dp_failed
	       on dp.last_failed_build_run_key=dp_failed.row_key
     join #DWH_TABLE_SCHEMA.d_build_run dp_stable
	       on dp.last_stable_build_run_key=dp_stable.row_key
     join #DWH_TABLE_SCHEMA.d_build_run dp_unstable
        	on dp.last_unstable_build_run_key=dp_unstable.row_key
   join  (SELECT lov.*, lov.dimension_code AS ci_state_code1, lov.dimension_name AS ci_state1
            FROM #DWH_TABLE_SCHEMA.d_lov lov
 -- JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
           where lov.dimension_class = 'STATE~BUILD'
        UNION 
    SELECT lov.*, lov.dimension_code AS ci_state_code1, lov.dimension_name AS ci_state1
           FROM #DWH_TABLE_SCHEMA.d_lov lov
        WHERE lov.row_key = -1 OR lov.row_key = 0) lov_wh1
            on d.build_state_src_key = lov_wh1.row_key
    join  (SELECT lov.*, lov.dimension_code AS ci_class_code, lov.dimension_name AS ci_class
        FROM #DWH_TABLE_SCHEMA.d_lov lov
        where lov.dimension_class = 'CLASS~BUILD'
   union
   SELECT lov.*, lov.dimension_code AS ci_class_code, lov.dimension_name AS ci_class
   FROM #DWH_TABLE_SCHEMA.d_lov lov
       WHERE lov.row_key = -1 OR lov.row_key = 0) lov_wh
            on d.build_class_key = lov_wh.row_key 
			join (
SELECT lov.*, lov.dimension_code AS ci_project_code, lov.dimension_name AS ci_project
FROM #DWH_TABLE_SCHEMA.d_lov lov
where lov.dimension_class = 'BUILDPROJECT~CLASS'
union
SELECT lov.*, lov.dimension_code AS ci_project_code, lov.dimension_name AS ci_project
FROM #DWH_TABLE_SCHEMA.d_lov lov
WHERE lov.row_key = -1 OR lov.row_key = 0)lov_wh2
on dp.buildproject_class_key=lov_wh2.row_key
	join #DWH_TABLE_SCHEMA.d_calendar_date dt
        on dt.row_key=f.build_start_on_key
    join #DWH_TABLE_SCHEMA.d_calendar_date dc
        on dc.row_key=dt.month_start_date_key
    where (dc.lagging_count_of_month between 0 and 12  )
            group by dp.name,d.build_number
			order by lower(dp.name),lower(d.build_number);